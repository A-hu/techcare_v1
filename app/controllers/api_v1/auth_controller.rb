class ApiV1::AuthController < ApiController

  before_action :authenticate_user!, :only => [:logout]

  def login
    success = false

    if params[:email] && params[:password]
      user = User.find_by_email( params[:email] )
      success = user && user.valid_password?( params[:password] )
    end

    if success
      render :json => { 
                        status:     "200",
                        message:    "Ok",
                        application_token: user.authentication_token,
                        IsCaregiver:  user.caregiver.try(:present?),
                        IsRequester:  user.requester.try(:prensent?)
                      }
    else
      render :json => { :message => "Email or Password is wrong" }, :status => 401
    end
  end

  def logout
    current_user.generate_authentication_token
    current_user.save!

    render :json => { :message => "Ok"}
  end

end
