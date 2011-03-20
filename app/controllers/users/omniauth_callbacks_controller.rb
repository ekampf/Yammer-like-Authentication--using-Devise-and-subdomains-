class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_apps
    logger.info { "#{params.inspect}" }
    logger.info { "env['omniauth.auth'] : #{env['omniauth.auth'].inspect}" }
    #logger.info { "end['omniauth.strategy'] : #{env['omniauth.strategy'].inspect}" }
    logger.info { "end['omniauth.origin'] : #{env['omniauth.origin'].inspect}" }
    
    domain = params[:domain]
    auth = request.env['omniauth.auth']
    user_info = auth['user_info']
    uid = auth['uid']
    email = user_info['email']
    
    # Verify domain
    if !(uid.starts_with?("http://#{domain}") || uid.starts_with?("https://#{domain}"))
      logger.error { "Unmatched domain!!!!!!" }
      flash[:notice] = I18n.t "Invalid domain. You must sign up from your company's domain!"
      redirect_to "/"
    end
    
    auth_domain = email[email.index("@")+1..-1]
    slug = auth_domain[0..auth_domain.index(".")-1]
    accnt = Account.find_or_create_by_slug(slug)
    accnt.auth_domain = auth_domain
    accnt.save
    
    @user = accnt.users.find_by_email(email)
    if @user.nil? then
      user_info[:account_id] = accnt.id
      user_info[:password] = Devise.friendly_token[0,20]      
      @user = User.create!(user_info)
    end

    flash[:notice] = "Success"
    sign_in_and_redirect @user, :event => :authentication
  end
end