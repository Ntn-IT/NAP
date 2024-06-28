# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        module Form
          class FormComponent < Component
            configure(
              grid: nil
            )
            def build_extra_param_inputs
              grid.query_params.except(:_method, :search).map do |(name, value)|
                build input_hidden(name, value:)
              end
            end
          end
        end
      end
    end
  end
end
