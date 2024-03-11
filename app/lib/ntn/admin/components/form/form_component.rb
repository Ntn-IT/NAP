# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Form
        class FormComponent < Component
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

          def fieldset
            Fieldset.new(self, bind_to, namespace)
          end
        end
      end
    end
  end
end
