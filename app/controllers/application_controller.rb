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
    
    # def sign_in_and_redirect(resource_or_scope, resource=nil)
    #   # Modify Devise's original functionto
    #   # => Handles case if user is visiting another subdomain and tries to sign in.
    #   # => Handles the redirect on sign up, sending them to their account root.
    #   scope = Devise::Mapping.find_scope!(resource_or_scope)
    #   resource ||= resource_or_scope
    #   sign_in(scope, resource) unless warden.user(scope) == resource
    #   if check_account_id
    #     redirect_to stored_location_for(scope) || after_sign_in_path_for(resource)
    #   else
    #     account_name = current_user.account.name
    #     token =  Devise.friendly_token
    #     current_user.loginable_token = token
    #     current_user.save
    #     sign_out(current_user)
    #     flash[:notice] = nil
    #     home_path = valid_user_url(token, :account => account_name)
    #     redirect_to home_path
    #   end
    # end  
    # 
    # def check_account_id
    #   logger.info { "check_account_id called! current_account is #{current_account}, current_user.account.id is #{current_user.account.id}" }
    #   return current_account ? current_user.account.id == current_account.id : false
    # end
end
