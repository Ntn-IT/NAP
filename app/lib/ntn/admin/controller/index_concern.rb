# frozen_string_literal: true

module Ntn
  module Admin
    module Controller
      module IndexConcern
        extend ActiveSupport::Concern

        included do |_base|
          helper_method(
            :index_records,
            :index_query_params,
            :index_selected_sort,
            :index_selected_sort_order
          )
        end

        def index
          index_authorize!

          index_apply_init_query
          index_apply_search
          index_apply_sort
          index_apply_pagination
        end

        private

        def index_authorize!
          #x [self.class.controller_name.classify.underscore.to_sym],
          authorize(
            [self.class.name.gsub(/Controller$/, "").classify.underscore.to_sym],
            :index?
          )
        end

        def index_apply_init_query
          @index_query = index_init_query
        end

        def index_init_query
          raise NotImplementedError
        end

        def index_apply_search
          search_scopes = index_search_scopes

          index_search_params.each do |search_key, search_value|
            next if search_value == ''

            scope = search_scopes[search_key]

            raise ArgumentError, "Search '#{search_key}' is not recognized" unless scope

            @index_query = scope.call(@index_query, search_value)
          end
        end

        def index_search_scopes; end

        def index_apply_sort
          return unless index_selected_sort || index_selected_sort_order

          sort_scopes = index_sort_scopes
          
          scope = sort_scopes[index_selected_sort]

          raise ArgumentError, "Sort '#{selected_sort}' is not recognized" unless scope

          @index_query = scope.call(@index_query, index_selected_sort_order)
        end

        def index_sort_scopes
          {}
        end

        def index_without_count
          false
        end

        def index_apply_pagination
          @index_query =
            if index_without_count
              @index_query.page(params[:page]).without_count
            else
              @index_query.page(params[:page])
            end
        end

        def index_records
          @index_query
        end

        def index_selected_sort
          params[:sort]&.to_sym || index_default_sort
        end

        def index_selected_sort_order
          params[:sort_order]&.to_sym || index_default_sort_order
        end

        def index_default_sort
          :created_at
        end

        def index_default_sort_order
          :desc
        end

        def index_query_params
          request.query_parameters.deep_symbolize_keys
        end

        def index_search_params
          (request.query_parameters['search'] || {}).symbolize_keys
        end
      end
    end
  end
end
