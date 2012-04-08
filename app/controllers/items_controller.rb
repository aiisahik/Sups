class ItemsController < ApplicationController

  layout :resolve_layout
  
  
  
  
  before_filter :confirm_logged_in


  def tag_cloud
    @tags = Item.tag_counts_on(:tags) || []
  end

  def index
    list
    @items = Item.where(:user_id => current_user.id).drop(1)
    render('list')
  end

  def list

   if (params[:collection_name] == nil) || (params[:collection_name] == "") 
   

      if (params[:starred] == "1")
        @items = Item.where(:starred => true).where(:user_id => current_user.id)
      else 
        if ((params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil))
          @items = Item.where(:user_id => current_user.id).drop(1)
        else
          if (params[:description] == "Text")
            @items = Item.tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id) | Item.tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id) | Item.where(:description => params[:description]).where(:user_id => current_user.id).drop(1) | Item.tagged_with(params[:collection_name], :on => :groups).where(:user_id => current_user.id)
          else
            @items = Item.tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id) | Item.tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id) | Item.where(:description => params[:description]).where(:user_id => current_user.id) | Item.tagged_with(params[:collection_name], :on => :groups).where(:user_id => current_user.id)
          end  
        end
      end
    
    else

      if (params[:starred] == "1")
        @items = Item.tagged_with(params[:collection_name]).where(:starred => true).where(:user_id => current_user.id).uniq
      else 
        if (params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil)
            @items = Item.where(:user_id => current_user.id).tagged_with(params[:collection_name]).uniq.drop(1)
        else 
          if (params[:description] == "Text")
            @items = Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).where(:description => params[:description]).where(:user_id => current_user.id).uniq.drop(1)
          else 
          @items = Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).where(:description => params[:description]).where(:user_id => current_user.id).uniq
          end        
        end
      end

    end

    
    @tags = Item.tag_counts_on(:tags) || []
    @events = Item.tag_counts_on(:events) || []
    @groups = Item.tag_counts_on(:groups) || []
    @group_name = params[:collection_name] || ""
    @item = Item.where(:user_id => current_user.id).first
   

    end 
  


    

    def grid 

if (params[:collection_name] == nil) || (params[:collection_name] == "") 
   

      if (params[:starred] == "1")
        @items = Item.where(:starred => true).where(:user_id => current_user.id)
      else 
        if ((params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil))
          @items = Item.where(:user_id => current_user.id).drop(1)
        else
          if (params[:description] == "Text")
            @items = Item.tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id) | Item.tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id) | Item.where(:description => params[:description]).where(:user_id => current_user.id).drop(1) | Item.tagged_with(params[:collection_name], :on => :groups).where(:user_id => current_user.id)
          else
            @items = Item.tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id) | Item.tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id) | Item.where(:description => params[:description]).where(:user_id => current_user.id) | Item.tagged_with(params[:collection_name], :on => :groups).where(:user_id => current_user.id)
          end  
        end
      end
    
    else

      if (params[:starred] == "1")
        @items = Item.tagged_with(params[:collection_name]).where(:starred => true).where(:user_id => current_user.id).uniq
      else 
        if (params[:tag_name] == nil) && (params[:event_name] == nil) && (params[:description] == nil)
            @items = Item.where(:user_id => current_user.id).tagged_with(params[:collection_name]).uniq.drop(1)
        else 
          if (params[:description] == "Text")
            @items = Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).where(:description => params[:description]).where(:user_id => current_user.id).uniq.drop(1)
          else 
          @items = Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:tag_name], :on => :tags).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).tagged_with(params[:event_name], :on => :events).where(:user_id => current_user.id).uniq | 
            Item.tagged_with(params[:collection_name], :on => :groups).where(:description => params[:description]).where(:user_id => current_user.id).uniq
          end        
        end
      end

    end

    
    @tags = Item.tag_counts_on(:tags) || []
    @events = Item.tag_counts_on(:events) || []
    @groups = Item.tag_counts_on(:groups) || []
    @group_name = params[:collection_name] || ""
    @item = Item.where(:user_id => current_user.id).first
   

    end 
  



  def show
    @item = Item.find(params[:id])
  end


  
  def new
    @item = Item.new
    @items = Item.where(:user_id => current_user.id)
   

    if params[:tagtype] == "events"
      
      if params[:term]
        @tags = current_user.owned_tags.where("context = ?", "events").find(:all,:conditions => ['name LIKE ?', "#{params[:term]}%"])
        
      else
        @tags = current_user.owned_tags.where("context = ?", "events")
        
      end
    else
      if params[:term]
        @tags = current_user.owned_tags.where("context = ?", "tags").find(:all,:conditions => ['name LIKE ?', "#{params[:term]}%"])
        
      else
        @tags = current_user.owned_tags.where("context = ?", "tags")
        
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tags}
    end
    #render :layout => "upload"

  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      current_user.tag(@item, :with => params[:item][:tag_list], :on => :tags)
      current_user.tag(@item, :with => params[:item][:group_list], :on => :groups)
      current_user.tag(@item, :with => params[:item][:event_list], :on => :events)
      flash[:notice] = 'Item created!'
      #redirect_to @item, :notice => :default
      #redirect_to(:action => 'list')
      if (params[:action_name] == 'grid')
        redirect_to(:action => params[:action_name], :collection_name => params[:collection_name])
      else
        redirect_to(:action => 'list', :collection_name => params[:collection_name])
      end
    else
      render("new")
    end
    #@upload = params[:item][:pic]
    #debugger
    #[{"name":"picture1.jpg",
    #   "size":902604,
    #   "url":"\/\/example.org\/files\/picture1.jpg",
    #   "thumbnail_url":"\/\/example.org\/thumbnails\/picture1.jpg",
    #   "delete_url":"\/\/example.org\/upload-handler?file=picture1.jpg",
    #   "delete_type":"DELETE"}]
    #
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render :json => @item}
    #end
  end


def createinitial
    @item = Item.new(:user_id => params[:user_id], :name => 89038409830948, :description => 'Text')
    if @item.save
      flash[:notice] = 'Account created! Please login'
      #redirect_to @item, :notice => :default
      #redirect_to(:action => 'list')
      redirect_to(:controller => 'access', :action => 'login')
    else
      flash[:notice] = 'Sorry, try again'
      redirect_to(:controller => 'users', :action => 'new')

    end
  end



  def edit
    @item = Item.find(params[:id])
    flash[:notice] = 'Item updating.'
    @items = Item.where(:user_id => current_user.id)


    if params[:term]
      @tags = current_user.owned_tags.where("context = ?", "tags").find(:all,:conditions => ['name LIKE ?', "#{params[:term]}%"]) | current_user.owned_tags.where("context = ?", "events").find(:all,:conditions => ['name LIKE ?', "#{params[:term]}%"])
      
    else
      @tags = current_user.owned_tags.where("context = ?", "tags") | current_user.owned_tags.where("context = ?", "events")
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tags}
    end

  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      current_user.tag(@item, :with => params[:item][:tag_list], :on => :tags)
      current_user.tag(@item, :with => params[:item][:group_list], :on => :groups)
      current_user.tag(@item, :with => params[:item][:event_list], :on => :events)
      flash[:notice] = 'Item updated.'
      #redirect_to @item, :notice => :default
      #redirect_to item_path(@item.id), :notice => :default
      if (params[:action_name] == 'grid')
        redirect_to(:action => params[:action_name], :collection_name => params[:collection_name])
      else
        redirect_to(:action => 'list', :collection_name => params[:collection_name])
      end

    else
      flash[:notice] = 'failed'
      render("list")
    end
  end


  def updatestar
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item updated.'
      #redirect_to @item, :notice => :default
      #redirect_to item_path(@item.id), :notice => :default
      if (params[:action_name] == 'grid')
        redirect_to(:action => params[:action_name], :collection_name => params[:collection_name])
      else
        redirect_to(:action => 'list', :collection_name => params[:collection_name])
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
        redirect_to(:action => params[:action_name], :collection_name => params[:collection_name])
      else
        redirect_to(:action => 'list', :collection_name => params[:collection_name])
      end

  end

  private

  def resolve_layout
    case action_name
    when "new", "new2"
      "upload"
    else
      "admin"
    end
  end
  
  
end


