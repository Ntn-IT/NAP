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
          redirect_to(new_sessions_path)
        end

        private

        def handle_with_redirect_error(
          redirect:, error_action:, redirect_record:, redirect_message: nil,
          error_message: nil, rescuable_errors: []
        )
          ActiveRecord::Base.transaction do
            record = yield

            return unless redirect

            if redirect_record && !record.is_a?(ActiveRecord::Base)
              raise ArgumentError,
                    'with_record_error_handler block must return a ActiveRecord::Base object ' \
                    'when redirect_record set to true'
            end

            id = redirect_record ? record.id : nil

            unless redirect.is_a?(Symbol)
              return redirect_to(
                redirect,
                notice: notice_success(message: redirect_message)
              )
            end

            redirect_to(
              { action: redirect, id: },
              notice: notice_success(message: redirect_message)
            )
              
          end
        rescue StandardError => e
          rescuable = rescuable_errors.one? { |res| e.is_a?(res) } ||
                      e.is_a?(ActiveRecord::RecordInvalid) ||
                      e.is_a?(ControllerError)

          raise unless rescuable

          self.notice = notice_error(error: e, message: error_message)

          render(error_action, status: :unprocessable_entity)
        end

        def handle_create(
          redirect: :show,
          error_action: :new,
          redirect_record: true,
          **kwargs,
          &block
        )
           handle_with_redirect_error(
            redirect:,
            error_action:,
            redirect_record:,
            **kwargs,
            &block
          )
        end

        def handle_update(
          redirect: :show,
          error_action: :edit,
          redirect_record: true,
          **kwargs, &block
        )
           handle_with_redirect_error(
            redirect:,
            error_action:,
            redirect_record:,
            **kwargs,
            &block
          )
        end

        def handle_destroy(
          redirect: :index,
          error_action: :show,
          redirect_record: false,
          **kwargs, &block
        )
           handle_with_redirect_error(
            redirect:,
            error_action:,
            redirect_record:,
            **kwargs,
            &block
          )
        end

        def handle_record_operation(
          redirect: :show, error_action: :show, redirect_record: true,
          **kwargs, &block
        )
           handle_with_redirect_error(
            redirect:,
            error_action:,
            redirect_record:,
            **kwargs,
            &block
          )
        end

        def whitelisted_params(instance_or_class)
          klass = instance_or_class.is_a?(Class) ? instance_or_class : instance_or_class.class
          namespace = klass.name.demodulize.underscore.to_sym
          policy_class_path = klass.name.underscore.to_sym

          return ActionController::Parameters.new unless params[namespace]

          params
            .require(namespace)
            .permit(*policy([policy_class_path]).permitted_attributes)
        end

        def user_not_authorized
          redirect_to(new_admin_panel_session_path)
        end

        def notice_success(message: nil)
          { status: :success, message: message || 'Operation completed !' }
        end

        def notice_error(error: nil, message: nil)
          msg = [message || 'Operation failed']
          msg << error.message if error

          {
            status: :danger,
            message: msg.join(' - details : '),
            backtrace: error && %w[development staging].include?(ENV.fetch('RAILS_ENV', nil)) ? error.backtrace : nil
          }
        end

        def notice
          return @notice if defined?(@notice)

          notice = super

          return unless notice
          return notice.deep_symbolize_keys if notice.is_a?(Hash)

          { status: :info, message: notice }
        end

        def notice=(notice)
          @notice = notice
        end

        def controller_error!(message)
          raise ControllerError, message
        end
      end
    end
  end
end
