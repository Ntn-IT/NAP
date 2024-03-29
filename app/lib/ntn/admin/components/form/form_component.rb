# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Form
        class FormComponent < Component
          DELEGATED_METHOD_SUFFIXES = %w[input field].freeze

          configure(
            method: :post,
            url: nil,
            form_data: false,
            buttons: nil,
            layout: nil,
            with_token: true,
            bind_to: nil,
            namespace: nil
          )

          def initial_scope
            Scope.new(self, bind_to, namespace)
          end
        end
      end
    end
  end
end
