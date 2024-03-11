# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Pagination
        module PaginationHelper
          def pagination(**, &)
            PaginationComponent.new(**, &)
          end
        end
      end
    end
  end
end
