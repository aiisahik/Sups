class ItemsController < ApplicationController

  #layout 'admin'

  #before_filter :confirm_logged_in

  
  def tag_cloud
    @tags = Item.tag_counts_on(:tags) || []
  end

  def index
    list
    @items = Item.all
    render('list')
  end

  def list
   
    if (params[:group_name] == nil) || (params[:group_name] == "") 
   

      if (params[:starred] == "1")
        @items = Item.where(:starred => true)
      else 
        if ((params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil))
          @items = Item.all
        else
         @items = Item.tagged_with(params[:tag_name]) | Item.tagged_with(params[:event_name]) | Item.where(:description => params[:description]) | Item.tagged_with(params[:group_name])
        end
      end
    
    else

      if (params[:starred] == "1")
        @items = Item.tagged_with(params[:group_name]).where(:starred => true)
      else 
        if (params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil)
            @items = Item.tagged_with(params[:group_name])
        else 
           @items = Item.tagged_with(params[:group_name]).tagged_with(params[:tag_name]) | Item.tagged_with(params[:group_name]).tagged_with(params[:event_name]) | Item.tagged_with(params[:group_name]).where(:description => params[:description])
        end
      end

    end
    
    @tags = Item.tag_counts_on(:tags) || []
    @events = Item.tag_counts_on(:events) || []
    @groups = Item.tag_counts_on(:groups) || []
    @group_name = params[:group_name] || ""


    end 

    

    def grid 

    if (params[:group_name] == nil) || (params[:group_name] == "") 
   

      if (params[:starred] == "1")
        @items = Item.where(:starred => true)
      else 
        if ((params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil))
          @items = Item.all
        else
         @items = Item.tagged_with(params[:tag_name]) | Item.tagged_with(params[:event_name]) | Item.where(:description => params[:description]) | Item.tagged_with(params[:group_name])
        end
      end
    
    else

      if (params[:starred] == "1")
        @items = Item.tagged_with(params[:group_name]).where(:starred => true)
      else 
        if (params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil)
            @items = Item.tagged_with(params[:group_name])
        else 
           @items = Item.tagged_with(params[:group_name]).tagged_with(params[:tag_name]) | Item.tagged_with(params[:group_name]).tagged_with(params[:event_name]) | Item.tagged_with(params[:group_name]).where(:description => params[:description])
        end
      end

    end
    
    @tags = Item.tag_counts_on(:tags) || []
    @events = Item.tag_counts_on(:events) || []
    @groups = Item.tag_counts_on(:groups) || []
    @group_name = params[:group_name] || ""


    end 

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = 'Item created!'
      #redirect_to @item, :notice => :default
      #redirect_to(:action => 'list')
      if (params[:action_name] == 'grid')
        redirect_to(:action => params[:action_name], :group_name => params[:group_name])
      else
        redirect_to(:action => 'list', :group_name => params[:group_name])
      end
    else
      render("new")
    end
  end

  def edit
    @item = Item.find(params[:id])
    flash[:notice] = 'Item updating.'
    @tags = Item.tag_counts_on(:tags) || []
    @events = Item.tag_counts_on(:events) || []
    @groups = Item.tag_counts_on(:groups) || []

  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item updated.'
      #redirect_to @item, :notice => :default
      #redirect_to item_path(@item.id), :notice => :default
      if (params[:action_name] == 'grid')
        redirect_to(:action => params[:action_name], :group_name => params[:group_name])
      else
        redirect_to(:action => 'list', :group_name => params[:group_name])
      end

    else
      flash[:notice] = 'failed'
      render("list")
    end
  end


  def delete
    @item = Item.find(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:notice] = "Item destroyed."
      if (params[:action_name] == 'grid')
        redirect_to(:action => params[:action_name], :group_name => params[:group_name])
      else
        redirect_to(:action => 'list', :group_name => params[:group_name])
      end

  end

end


