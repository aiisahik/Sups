class CollectionsController < ApplicationController

def index
    list
    render('list')
  end

  def list
    @collections = Collection.all
  end

  def show
    @collection = Collection.find params[:id]
    render 'edit'
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(params[:collection])
    if @collection.save
      flash[:notice] = 'Collection created.'

      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    flash[:notice] = 'Collection updating.'
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes(params[:collection])
      flash[:notice] = 'Collection updated.'
      redirect_to @collection, :notice => :default
      #redirect_to collection_path(@collection.id), :notice => :default

      #redirect_to(:action => 'list')
    else
      flash[:notice] = 'failed.'
      render("list")
    end
  end

  def delete
    @collection = Collection.find(params[:id])
  end

  def destroy
    Collection.find(params[:id]).destroy
    flash[:notice] = "Collection destroyed."
    redirect_to(:action => 'index')
  end

end