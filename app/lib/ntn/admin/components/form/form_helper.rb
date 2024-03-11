# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Form
        module FormHelper

          def form(**, &yield_block)
            FormComponent.new(**, yield_block:)
          end

        end
      end
    end
  end
end
