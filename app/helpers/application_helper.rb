module ApplicationHelper


  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end

  def bootstrap_will_paginate(collection, options={})
    will_paginate(collection, options.merge(:renderer => WillPaginate::ActionView::BootstrapLinkRenderer))
  end


end
