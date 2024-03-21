# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Element
        module ElementHelper
          def element(**, &)
            ElementComponent.new(**, &)
          end

          def icon_tag(icon:, **, &yield_block)
            element(type: :i, css: icon, **, &yield_block)
          end

          def main_content_header(**, &)
            element(type: :header, css: 'main-content-header', **, &)
          end

          def main_content_footer(**, &)
            element(type: :footer, css: 'main-content-footer', **, &)
          end
        end
      end
    end
  end
end
