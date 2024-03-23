# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module List
        module ListHelper
          def list(items, **, &)
            ListComponent.new(items:, **, &)
          end
        end
      end
    end
  end
end
