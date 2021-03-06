class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[email fname lname username password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_in, keys: %i[username password]
    devise_parameter_sanitizer.permit :account_update, keys: %i[email username password password_confirmation remember_me]
  end

end
