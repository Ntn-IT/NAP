# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module App
        module AppHelper

          def app(**, &yield_block)
            AppComponent.new(**, yield_block:)
          end

        end
      end
    end
  end
end
