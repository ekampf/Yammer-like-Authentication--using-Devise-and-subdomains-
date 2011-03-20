class User < ActiveRecord::Base
  belongs_to :account
  
  # Validations
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :account
   
  validates_uniqueness_of :name, :email, :case_sensitive => false, :scope => :account_id

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable, 
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :account_id, :name, :email, :password, :password_confirmation, :remember_me  
  
  def self.valid_token?(params)
    Rails.logger.info("User.valid_token? called with #{params}")
    token_user = self.where(:loginable_token => params[:id]).first
    if token_user
      token_user.loginable_token = nil
      token_user.save
    end
    return token_user
  end
end
