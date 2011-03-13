class Users::RegistrationsController < Devise::RegistrationsController 
  
  # POST /resource/sign_up
  # def create
  #   Rails.logger.info("Users::RegistrationsController called with #{params.inspect}")
  #   
  #   new_account_info = params[:email]
  #   
  #   # Create a new account when (before) a new user is created
  #   if new_account_info.blank? then
  #     Rails.logger.warn("create_account called but self.new_account_info is blank - #{self.new_account_info.inspect}")
  #     return nil
  #   end
  #   
  #   if !(new_account_info.has_key?("name") && new_account_info.has_key?("subdomain")) then
  #     Rails.logger.warn("create_account called but self.new_account_info is missing required information: #{self.new_account_info.inspect}")
  #     return nil
  #   end
  #   
  #   Rails.logger.info("new_account_info is #{new_account_info.inspect}")
  #   
  #   acct = Account.find_by_subdomain(new_account_info[:subdomain])
  #   if acct.nil? then
  #     Rails.logger.info("creating account")
  #     acct = Account.create!(new_account_info)
  #   end
  # 
  #   # Set the user's account id to the account we just found/created
  #   params[:user][:account_id] = acct.id
  #   
  #   super
  # end  
  
end