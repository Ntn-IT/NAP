# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  def after_sign_in_path_for(resource)
    home_path
  end
end