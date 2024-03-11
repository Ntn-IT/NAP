# frozen_string_literal: true

module Ntn
  module Admin
    module Controller
      module ControllerConcern

        extend ActiveSupport::Concern

        include ::Pundit::Authorization
        include ::ActiveRecord::Sanitization::ClassMethods
        include IndexConcern

        included do |_base|
          before_action :authenticate_user!
          after_action :verify_authorized
        end

        def authenticate_user!
          return if current_user

          session[:redirect_url] = request.fullpath
          redirect_to(home_path)
        end

      end
    end
  end
end
