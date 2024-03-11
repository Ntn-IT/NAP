# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Table
        module TableHelper

          def table(**, &)
            TableComponent.new(**, &)
          end

        end
      end
    end
  end
end
