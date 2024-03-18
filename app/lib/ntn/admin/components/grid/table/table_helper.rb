# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        module Table
          module TableHelper
            def grid_table(grid, **, &)
              TableComponent.new(grid:, **, &)
            end
          end
        end
      end
    end
  end
end
