class UsersController < ApplicationController

  layout 'admin'

  before_filter :confirm_logged_in, :except => [:new, :create, :forgot_password, :change_password]

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
      flash[:notice] = 'User created!'
      #redirect_to @user, :notice => :default
      #redirect_to(:action => 'list')
      redirect_to(:controller => 'items', :action => 'createinitial', :user_id => @user.id)
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
      #redirect_to @user, :notice => :default
      #redirect_to user_path(@user.id), :notice => :default
      redirect_to(:action => 'index')

    else
      flash[:notice] = 'Failed'
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

    def forgot_password
    if request.post?
      u= User.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:message]  = "A new password has been sent by email."
        redirect_to :action=>'login'
      else
        flash[:warning]  = "Couldn't send password"
      end
    end
  end

  def change_password
    @user=session[:user]
    if request.post?
      @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:message]="Password Changed"
      end
    end
  end

end