class ApplicationController < ActionController::Base
  protect_from_forgery

  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end


end
