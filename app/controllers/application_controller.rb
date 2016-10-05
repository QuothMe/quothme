class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

   def configure_permitted_parameters
    #registration_params = [:email, :password, :password_confirmation, :name, :type]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :profile_picture, :last_name, :type, :username) }
  end

end
