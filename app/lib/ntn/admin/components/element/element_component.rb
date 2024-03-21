# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Element
        class ElementComponent < Component
          configure(
            type: :div
          )

          def call
            tag.send(type, **merge_attributes) { content }
          end
        end
      end
    end
  end
end
