# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Format
        class FormatComponent < Component
          configure(
            text: nil
          )

          def call
            tag.span(**merge_attributes(css: 'format')) do
              build(text)
            end
          end
        end
      end
    end
  end
end
