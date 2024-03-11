# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Grid
        class GridComponent < Component
          configure(
            model: nil,
            rows: nil,
            attributes: nil,
            actions: nil,
            pagination: nil,
            query_params: {},
            selected_sort: nil,
            selected_sort_order: nil,
            form: nil,
            form_layout: nil
          )

          def build_model_url_with_params(except:, **params)
            build_model_url(
              model,
              index: true,
              params: { **query_params_except(*except), **params }
            )
          end

          def query_params_except(*excepts)
            params = query_params.dup
            excepts.each { params.delete(_1) }

            params
          end
        end
      end
    end
  end
end
