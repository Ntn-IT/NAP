# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module TableAttributes
        module TableAttributesHelper
          def table_attributes(**, &)
            TableAttributesComponent.new(**, &)
          end
        end
      end
    end
  end
end
