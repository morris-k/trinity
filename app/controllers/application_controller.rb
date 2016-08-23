class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @key = API_MAPS

  before_action :configure_permitted_parameters, if: :devise_controller?

  

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_in) << :admin
  end
end
