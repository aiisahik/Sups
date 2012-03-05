class UsersController < ApplicationController

  #layout 'admin'

  #before_filter :confirm_logged_in

  def index
    list
    render('list')
  end

  def list
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    render 'edit'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User created.'
      redirect_to @user, :notice => :default
      #redirect_to(:action => 'list')
    else
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
    flash[:notice] = 'User updating.'
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User updated.'
      redirect_to @user, :notice => :default
      #redirect_to user_path(@user.id), :notice => :default

      #redirect_to(:action => 'list')
    else
      flash[:notice] = 'failed.'
      render("list")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to(:action => 'index')
  end

end