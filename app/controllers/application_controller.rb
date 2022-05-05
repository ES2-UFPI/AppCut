class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include Pundit::Authorization
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :document, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :document, :profile])
  end
end
