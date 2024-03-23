# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Element
        module ElementHelper
          def element(**, &)
            ElementComponent.new(**, &)
          end

          def divider(**kwargs)
            element(type: :span, css: "divider", **kwargs)
          end

          def icon(ico, **, &yield_block)
            element(type: :i, css: ico, **, &yield_block)
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
