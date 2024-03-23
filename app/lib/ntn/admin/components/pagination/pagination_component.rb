# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Pagination
        class PaginationComponent < Component
          configure(
            current_page: nil,
            total_pages: nil,
            total_count: nil,
            per_page: nil,
            model: nil,
            query_params: nil,
            delta: 5
          )

          def call
            tag.nav(**merge_attributes(css: 'pagination-container')) do
              build([
                      build_legend,
                      build_pages_list
                    ])
            end
          end

          def min_page
            @min_page ||= [1, current_page - delta].max
          end

          def max_page
            @max_page = [current_page + delta, total_pages].min
          end

          def build_legend
            tag.p do
              build([
                      t('Displaying'),
                      tag.strong do
                        build "&nbsp;#{(current_page - 1) * per_page + 1}&nbsp;-&nbsp;#{current_page * per_page}"
                      end,
                      total_count ? "&nbsp;of&nbsp;<b>#{total_count}</b>" : nil
                    ])
            end
          end

          def build_pages_list
            return if max_page.zero?

            pages = []

            pages << build_page_item('<<', 1, disabled: current_page == 1)

            (min_page..max_page).each do |page|
              pages << build_page_item(page.to_s, page, selected: current_page == page)
            end

            pages << build_page_item('>>', total_pages, disabled: current_page == total_pages)

            list(pages, css: 'pagination pagination-sm')
          end

          def build_page_item(text, page, selected: false, disabled: false)
            url = build_model_url(model, index: true, params: { **query_params, page: })

            {
              css: "page-item#{selected ? ' active' : ''}#{disabled ? ' disabled' : ''}",
              value: link(url:, text:, css: 'page-link')
            }
          end
        end
      end
    end
  end
end
