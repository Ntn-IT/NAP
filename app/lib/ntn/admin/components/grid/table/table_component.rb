# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        module Table
          class TableComponent < Components::Table::TableComponent
            configure(
              grid: nil,
              selected_sort: nil,
              selected_sort_order: nil
            )
          end
        end
      end
    end
  end
end
