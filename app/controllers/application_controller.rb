class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

   def configure_permitted_parameters
    #registration_params = [:email, :password, :password_confirmation, :name, :type]
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :profile_picture, :last_name, :type, :username) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :profile_picture, :last_name, :type, :username) }
  end

  def account_update
  end

  


end
