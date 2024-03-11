# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Field
        class FieldComponent < Component
          configure(
            type: nil,
            name: nil,
            label: nil,
            id: nil,
            bound_attribute: nil,
            namespace: nil,
            bind_to: nil
          )

          def call
            tag.div(class: "form-group#{errors.present? ? ' has-error' : nil}") do
              build([
                      build_label,
                      build_input,
                      build_error
                    ])
            end
          end

          def build_label
            tag.label(class: 'control-label', for: id) { build label }
          end

          def build_input
            build(input(type, name, id:, namespace:, bind_to:, bound_attribute:, **extra_attributes))
          end

          def build_error
            return unless errors

            list(
              errors.map { { value: build([icon('fa fa-warning'), _1]) } },
              css: 'invalid-feedback'
            )
          end

          def label
            return @label if defined?(@label)

            name.to_s.split(/\.|_|-/).map(&:capitalize).join(' ')
          end

          def errors
            return @errors if defined?(@errors)

            @errors ||=
              begin
                errors = Ntn::Utils::ObjectUtil.lookup(
                  Ntn::Utils::ObjectUtil.lookup(bind_to, :errors),
                  bound_attribute
                )

                if !errors || (errors.empty? && bound_attribute.to_s.end_with?('_id'))
                  errors = Ntn::Utils::ObjectUtil.lookup(
                    Ntn::Utils::ObjectUtil.lookup(bind_to, :errors),
                    :"#{bound_attribute.to_s.gsub(/_id$/, '')}"
                  )
                end

                errors
              end
          end

          def id
            @id ||= SecureRandom.hex
          end

          def bound_attribute
            @bound_attribute ||= @name
          end
        end
      end
    end
  end
end
