class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.permit(:name, :phone_number, :shelter_logo_url, :street_address, :city, :zip_code,
      :state, :email, :password, :logo, :first_name, :last_name, :email_notifications)
    }
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:name, :phone_number, :shelter_logo_url, :street_address, :city, :zip_code,
      :state,:email, :password, :current_password, :logo, :first_name, :last_name, :email_notifications)
    }
  end
end
