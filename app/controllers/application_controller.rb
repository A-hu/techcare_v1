class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :cell_phone_number, :home_phone_number, :line_id, :nickname, :type])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :cell_phone_number, :home_phone_number, :line_id, :nickname, :type])
	end
end
