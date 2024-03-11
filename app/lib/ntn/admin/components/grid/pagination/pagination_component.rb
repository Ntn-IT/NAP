# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        module Pagination
          class PaginationComponent < Components::Pagination::PaginationComponent

            configure(
              grid: nil,
            )

            delegate :resource, to: :grid

            delegate :query_params, to: :grid

          end
        end
      end
    end
  end
end
