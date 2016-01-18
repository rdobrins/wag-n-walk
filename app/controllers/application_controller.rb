class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(*)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [
      :avatar,
      :phone_number,
      :address,
      :city,
      :state,
      :zip,
      :walker
    ]
    devise_parameter_sanitizer.for(:sign_up) << [
      :first_name,
      :last_name,
      :avatar,
      :phone_number,
      :address,
      :city,
      :state,
      :zip,
      :walker
    ]
  end
end
