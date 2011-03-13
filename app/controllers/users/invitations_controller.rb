class Users::InvitationsController < Devise::InvitationsController

  # GET /resource/invitation/new
  def new
    logger.info { "Users::InvitationsController.new" }
    super
  end

  # POST /resource/invitation
  def create
    logger.info { "Users::InvitationsController.create" }
    super
  end

  # GET /resource/invitation/accept?invitation_token=abcdef
  def edit
    logger.info { "Users::InvitationsController.edit" }
    super
  end

  # PUT /resource/invitation
  def update
    # Override the default user creation logic in Devise::InvitationsController to create a user that belongs
    # to an account
    logger.info { "Users::InvitationsController.update" }
    
    # Read the invited user's email
    invited_user = User.find_by_invitation_token(params[:user][:invitation_token])
    logger.info { "Invited user is #{invited_user.inspect}" }
    
    email = invited_user.email
    
    slug = email[email.index("@")+1..-1]
    slug = slug[0..slug.index(".")-1]
    
    accnt = Account.find_or_create_by_slug(slug)
    
    # Add the account id to the params
    params[:user][:account_id] = accnt.id
    
    logger.info { "New params: #{params.inspect}" }

    super
  end

end
