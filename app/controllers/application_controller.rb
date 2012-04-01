class ApplicationController < ActionController::Base
  protect_from_forgery

  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end

  def self.find_or_create_with_like_by_name(name)
    find(:first, :conditions => ["name =", name]) || create(:name => name)
  end

protected

  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice] = "Please log in."
  		redirect_to(:controller => 'access', :action => 'login')
  		return false
	  else
	  	return true
	  end
	end

end

private

  # Finds the User with the ID stored in the session with the key :current_user_id
  # This is a common way to do user login in a Rails application; logging in sets the
  # session value and logging out removes it.
  def current_user
    @_current_user ||= session[:user_id] && User.find(session[:user_id])
  end


