# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  before_action :configure_sign_up_params, only: [:create]

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_id])
  end

end
