class HomeController < ApplicationController
  def index
    # If root domain => Show splash signup page
    # If subdomain:
    # => User not signed in => Show login
    # => Used signed in => Show content
    
    if is_root_domain? then
      logger.info { "root signup" }
      return render
    else
      logger.info { "*"*80 }
      if user_signed_in? then
        logger.info { "index" }
        return render :action => :index_signed_in
      else
        logger.info { "redirect to login" }
        return redirect_to new_user_session_url
      end
    end
    
    render
  end
  
  def index_signed_in
  end
end
