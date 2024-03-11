# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Alert
        module AlertHelper

          def alert(message, status, backtrace = nil, **kwargs)
            AlertComponent.new(message:, status:, backtrace:, **kwargs)
          end

          def success_alert(message, **kwargs)
            alert(message, "success", **kwargs)
          end

          def error_alert(message, backtrace = nil, **kwargs)
            alert(message, "error", backtrace, **kwargs)
          end

          def warning_alert(message, backtrace = nil, **kwargs)
            alert(message, "warning", backtrace, **kwargs)
          end

          def info_alert(message, **kwargs)
            alert(message, "info", **kwargs)
          end

        end
      end
    end
  end
end
