# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module List
        class ListComponent < Component
          configure(
            items: nil
          )

          def call
            tag.ul(**merge_attributes) do
              build(
                [
                  items.map do |item|
                    next tag.li { build item } if item.is_a?(String) || item.is_a?(Symbol)
                    next build(item) unless item.is_a?(Hash)

                    tag.li(css: item[:css]) { build item[:value] }
                  end
                ]
              )
            end
          end
        end
      end
    end
  end
end
