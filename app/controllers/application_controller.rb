class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  include ApplicationHelper
  protected
  
  # layout :layout_by_resource

  # def layout_by_resource
  #     if devise_controller? && !user_signed_in?
  #       "sign_in"
  #     else
  #       "application"
  #     end
  # end
  # Permit the devise parameters.


  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:mobile_no ,:email, :password, :password_confirmation, :remember_me,:is_admin])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:mobile_no ,:email, :password, :password_confirmation, :remember_me,:is_admin])
  end

end
