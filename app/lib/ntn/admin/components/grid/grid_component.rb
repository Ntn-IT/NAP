# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        class GridComponent < Component
          configure(
            resource: nil,
            rows: nil,
            attributes: nil,
            pagination: nil,
            query_params: {},
            selected_sort: nil,
            selected_sort_order: nil
          )

          def build_url_with_params(except_query_params:, **params)
            build_url(
              resource:,
              index: true,
              params: { **query_params_except(excepts), **params }
            )
          end

          def query_params_except(excepts)
            params = query_params.dup
            excepts.each { params.delete(_1) }

            params
          end
        end
      end
    end
  end
end
