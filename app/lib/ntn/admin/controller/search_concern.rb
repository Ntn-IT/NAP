# frozen_string_literal: true

module CheerzOnRails
  module AdminPanel
    module Controller
      module SearchConcern
        extend ActiveSupport::Concern

        included do |_base|
          attr_reader :search_result

          helper_method(:search_filter, :search_result)
        end

        def search_scopes; end

        def search
          authorize(%i[admin_panel search], :search?)

          apply_search_filter

          return unless search_result

          resource_url_method = :"admin_panel_#{search_result['resource']}_path"

          redirect_to(send(resource_url_method, id: search_result['id']))
        end

        private

        def search_filter
          @search_filter ||= params.required(:search).strip
        end

        def apply_search_filter
          scopes = search_scopes

          return unless scopes

          sub_queries =
            search_scopes.map do |resource, filter_builder|
              query = filter_builder.call(search_filter)
              next unless query

              query.select(:id, "'#{resource}' as resource").to_sql
            end

          sql = "(#{sub_queries.compact.join(') UNION (')})"

          @search_result = ActiveRecord::Base.connection.execute(sql).to_a.first
        end
      end
    end
  end
end
