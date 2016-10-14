class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	before_action :authenticate_user_from_token!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user_from_token!

    if params[:auth_token].present?
      user = User.find_by_authentication_token(
                  params[:auth_token] )

      # Devise: 設定 current_user
      sign_in user, store: false if user
    else
    	# redirect_to new_user_registration_path
    end

  end

  protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, 
	  																									 :last_name, 
	  																									 :cell_phone_number, 
	  																									 :home_phone_number, 
	  																									 :line_id, 
	  																									 :nickname,
	  																									 :picture,
	  																									 caregiver_attributes: [:user_id, :introduction, :experience, :skill, :licence_number, :licence_offdate, :training],
	  																									 requester_attributes: [:user_id, :address, :condition_description]
	  																									])
	  
	  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, 
	  																													:last_name, 
	  																													:cell_phone_number, 
	  																													:home_phone_number, 
	  																													:line_id, 
	  																													:nickname, 
	  																													:picture,
	  																													caregiver_attributes: [:user_id, :introduction, :experience, :skill, :licence_number, :licence_offdate, :training],
	  																												  requester_attributes: [:user_id, :address, :condition_description]
	  																												 ])
	end
end
