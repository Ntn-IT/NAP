# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        module Pagination
          module PaginationHelper

            def grid_pagination(grid, **, &)
              
              PaginationComponent.new(grid:, **, &)
            end
          end

        end
      end
    end
  end
end
