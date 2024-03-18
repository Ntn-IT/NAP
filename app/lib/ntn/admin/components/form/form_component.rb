# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Form
        class FormComponent < Component
          configure(
            method: :post,
            action: nil,
            form_data: false,
            buttons: nil,
            with_token: true
          )
        end
      end
    end
  end
end
