class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  
  helper_method :current_account, :is_root_domain?
  before_filter :current_account
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
      
      return current_account
    end
    
    nil
  end
  
  protected  
    def after_sign_in_path_for(resource_or_scope)
      # Modify Devise's original function to redirect the user to their account's root 
      # in case they logged in from the root domains
      
      logger.info { "after_sign_in_path_for" }
      
      scope = Devise::Mapping.find_scope!(resource_or_scope)
      if current_account.nil? then
        # Log out of the root domain, redirect to subdomain and login there
        token = Devise.friendly_token # generates a random string to be used for loggin the user in again
        current_user.loginable_token = token
        current_user.save
        sign_out(current_user)
        
        flash[:notice] = nil
        home_path = valid_user_url(token, :account_subdomain => current_user.account.slug)
        return home_path
      end
      
      super
    end
end
