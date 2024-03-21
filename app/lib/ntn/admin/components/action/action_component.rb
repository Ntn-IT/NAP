# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Action
        class ActionComponent < ::Ntn::Component
          configure(
            text: nil,
            icon: nil,
            url: nil,
            type: nil,
            method: nil,
            confirm: false,
            confirm_text: t('Confirm operation ?'),
            turbo: true,
            turbo_action: 'advance',
            turbo_frame: 'app-frame'
          )

          def call
            tag.a(
              href: url,
              **merge_attributes(
                css: icon ? 'has-icon' : nil,
                data: {
                  controller: 'action',
                  type:,
                  confirm: confirm || nil,
                  confirm_text: confirm ? confirm_text : nil,
                  turbo:,
                  turbo_action: turbo ? turbo_action : nil,
                  turbo_frame: turbo ? turbo_frame : nil,
                  action: 'click->action#click'
                }
              )
            ) do
              build(
                [
                  build_icon,
                  build_content,
                  build_form
                ]
              )
            end
          end

          def build_icon
            build([icon_tag(icon:), '&nbsp;']) if icon
          end

          def build_content
            return [text, content] unless icon

            tag.span(class: 'btn-label') { build([text, content]) }
          end

          def build_form
            return if method.nil? || method.to_s.casecmp('get').zero?

            build(
              form(
                method: method.to_s.downcase,
                action: url,
                css: 'hidden',
                data: { action_target: 'form' }
              )
            )
          end
        end
      end
    end
  end
end
