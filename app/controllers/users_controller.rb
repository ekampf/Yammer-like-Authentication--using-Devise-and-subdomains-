require 'gapps_discovery'

class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end
  
  def verify_email
    logger.info { "#{params.inspect}" }
    
    email = params[:user][:email]
    
    logger.info { "email is #{email}" }
    
    domain = email[email.index("@")+1..-1]
        
    if GoogleAppsDiscovery.is_google_apps?(domain)
      redirect_to "/signup/confirm"
    else
      redirect_to "/signup/confirm_email"
    end
  end
end
