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
      redirect_to "/users/signup/confirm?email=#{email}"
    else
      redirect_to "/users/signup/confirm_email?email=#{email}"
    end
  end
  
  def confirm
    # => called when the user's email domain is Google Apps...
    logger.info { "#{params.inspect}" }
    email = params[:email]
    
    logger.info { "email is #{email}" }
    
    @domain = email[email.index("@")+1..-1]
    @openid_url = "https://www.google.com/a/#{@domain}/o8/ud?be=o8"
    
    logger.info { "domain is #{@domain}" }
    
    render :layout => "home"
  end
  
  def confirm_email
    # => an invitation email will be sent to new_user@example.com
    email = params[:email]
    User.invite!(:email => email)
    render :layout => "home"
  end
  
  def valid
    user = User.valid_token?(params)
    if user then
      sign_in(:user, user)
      flash[:notice] = "You've logged in!"
    else
      flash[:alert] = "Could not validate login!"
    end
    redirect_to :root
  end
end
