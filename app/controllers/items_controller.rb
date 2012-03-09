class ItemsController < ApplicationController

  #layout 'admin'

  #before_filter :confirm_logged_in

  def index
    list
    render('list')
  end

  def list
    @items = Item.all
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
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @item = Item.find(params[:id])
    flash[:notice] = 'Item updating.'
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item updated.'
      #redirect_to @item, :notice => :default
      #redirect_to item_path(@item.id), :notice => :default
      redirect_to(:action => 'index')

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
    redirect_to(:action => 'index')
  end

end


