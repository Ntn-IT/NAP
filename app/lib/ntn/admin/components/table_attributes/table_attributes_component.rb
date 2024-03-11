# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module TableAttributes
        class TableAttributesComponent < Component

          configure(
            attributes: nil,
            bind_to: nil,
          )

          def validate!
            component_error!("Attributes must be a Array") unless attributes.is_a?(Array)

            attributes.each do |row|
              component_error!("Attribute must define 'header' or a 'key' property") unless row[:header] || row[:key]
              component_error!("Attribute must define 'value' property") unless row[:value]
            end
          end

          def call
            tag.table(**merge_attributes(css: "table-attributes")) do
              tag.tbody do
                build(
                  attributes.map do |attribute|
                    tag.tr do
                      build(
                        [
                          tag.th(class: "border-right padding backgroud-gray") { build_header(attribute) },
                          tag.td(class: "padding") { build_value(attribute) },
                        ],
                      )
                    end
                  end,
                )
              end
            end
          end

          def build_header(attribute)
            attribute[:header] ? build(attribute[:header], bind_to, **attribute) : build_sym(attribute[:key])
          end

          def build_value(attribute)
            build(attribute[:value], bind_to)
          end

        end
      end
    end
  end
end
