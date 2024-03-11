# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Ntn::Admin::Controller::ControllerConcern

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render text: exception, status: 500
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
end
