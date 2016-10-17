class Users::RegistrationsController < Devise::RegistrationsController
protected
	def after_sign_up_path_for(resource)
  	flash[:notice] = 'Welcome! You have signed up successfully.'
  	roles_path
	end
end