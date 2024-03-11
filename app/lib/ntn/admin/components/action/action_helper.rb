# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Action
        module ActionHelper

          def action(text: nil, css_factory: nil, css: nil, **, &yield_block)
            ActionComponent.new(
              text:,
              css: "#{ css_factory } #{ css }".strip,
              yield_block:,
              **,
            )
          end

          def link(text: nil, **, &)
            action(text:, css_factory: "link", **, &)
          end

          def record_link(record, attribute = :id, **)
            link(
              text: record ? record.send(attribute) : nil,
              url: build_url(resource: record, params: record&.id),
              **,
            )
          end

          def button(text: nil, **, &)
            action(text:, css_factory: "btn btn-default", **, &)
          end

          def primary_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-primary", **, &)
          end

          def secondary_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-secondary", **, &)
          end

          def success_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-success", **, &)
          end

          def info_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-info", **, &)
          end

          def warning_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-warning", **, &)
          end

          def danger_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-danger", **, &)
          end

          def light_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-light", **, &)
          end

          def dark_button(text: nil, **, &)
            action(text:, css_factory: "btn btn-dark", **, &)
          end

        end
      end
    end
  end
end
