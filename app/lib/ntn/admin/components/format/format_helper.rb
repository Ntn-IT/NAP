# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Format
        module FormatHelper

          def format(**, &)
            FormatComponent.new(**, &)
          end

          def date_format(date, **)
            format(
              text: date ? date.strftime("%Y/%m/%d %H:%M:%S") : nil,
              **,
            )
          end

          def badge_format(badge, **)
            format(
              text: badge,
              css: "badge badge-#{ badge }",
              **,
            )
          end

        end
      end
    end
  end
end
