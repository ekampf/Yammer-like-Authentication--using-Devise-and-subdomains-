class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  
  helper_method :current_account, :is_root_domain?
  before_filter :set_mailer_url_options
  
  def is_root_domain?
    # return true if there is no subdomain
    result = (request.subdomains.first.present? && request.subdomains.first != "www") ? false : true
  end
  
  def current_account
    # Returns the current account according to the request's subdomain.
    # Redirects to homepage if not found.
    if !is_root_domain? then
      current_account = Account.find_by_slug(request.subdomains.first)
      if current_account.nil? then
        redirect_to root_url(:account_subdomain => false, :alert => "Unknown account/subdomain.")
      end
    end
    
    nil
  end
end
