# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Alert
        class AlertComponent < Component

          configure(
            message: nil,
            status: nil,
            backtrace: nil
          )
        end
      end
    end
  end
end
