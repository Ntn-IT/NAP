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
            build([vc.icon(icon), '&nbsp;']) if icon
          end

          def build_content
            submit_btm = type == "submit" ? tag.input(type: "submit", class: "hidden") : nil

            return [text, content, submit_btm] unless icon

            tag.span(class: 'btn-label') do 
              build([text, content,submit_btm ]) 
            end
          end

          def build_form
            return if method.nil? || method.to_s.casecmp('get').zero?

            build(
              form(
                method: method.to_s.downcase,
                url:,
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
