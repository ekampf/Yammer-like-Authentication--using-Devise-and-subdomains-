class Users::SessionsController < Devise::SessionsController
  layout "splash"
  
  # GET /resource/sign_in
  def new
    logger.info { "Users::SessionsController.new called" }
    if is_root_domain? then
      logger.info { "b" }
      return redirect_to root_url(:account_subdomain => false, :alert => "Sign-up not permitted from a subdomain - quit mucking with the url")
    end
    
    logger.info { "c" }
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  # 
  # # GET /resource/sign_out
  # def destroy
  #   super
  # end
end