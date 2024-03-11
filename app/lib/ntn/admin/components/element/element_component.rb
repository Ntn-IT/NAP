# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Element
        class ElementComponent < Component
          configure(
            type: :div,
            value: nil
          )

          def call
            tag.send(type, **merge_attributes) { build([value, content]) }
          end
        end
      end
    end
  end
end
