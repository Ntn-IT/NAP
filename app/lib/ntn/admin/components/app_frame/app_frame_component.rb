# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module AppFrame
        class AppFrameComponent < Component
          configure(
            title: nil,
            actions: [],
            notice: nil
          )
        end
      end
    end
  end
end
