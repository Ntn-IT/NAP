# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        module GridHelper
          include Table::TableHelper
          include Pagination::PaginationHelper

          def grid(**, &)
            GridComponent.new(**, &)
          end

          def records_grid(records, **)
            grid(
              resource: records.klass,
              rows: records,
              pagination: {
                current_page: records.current_page,
                total_pages: records.is_a?(::Kaminari::PaginatableWithoutCount) ? 10_000 : records.total_pages,
                total_count: records.is_a?(::Kaminari::PaginatableWithoutCount) ? nil : records.total_count,
                per_page: records.limit_value
              },
              **
            )
          end

          def index_grid(index, **)
            records_grid(
              index.index_records,
              selected_sort: index.index_selected_sort,
              selected_sort_order: index.index_selected_sort_order,
              query_params: index.index_query_params,
              **
            )
          end
        end
      end
    end
  end
end
