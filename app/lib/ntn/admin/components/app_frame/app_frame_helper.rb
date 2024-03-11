# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module AppFrame
        module AppFrameHelper

          def app_frame(**, &yield_block)
            AppFrameComponent.new(**, yield_block:)
          end

        end
      end
    end
  end
end
