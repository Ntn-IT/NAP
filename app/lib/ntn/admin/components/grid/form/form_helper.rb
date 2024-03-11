# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        module Form
          module FormHelper
            def grid_form(grid, **kwargs)
              FormComponent.new(grid:, **kwargs)
            end
          end
        end
      end
    end
  end
end
