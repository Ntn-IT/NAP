# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module TableAttributes
        class TableAttributesComponent < Component
          configure(
            attributes: nil,
            bind_to: nil
          )

          def validate!
            component_error!('Attributes must be a Array') unless attributes.is_a?(Array)

            attributes.each do |row|
              component_error!("Attribute must define 'name' or a 'key' property") unless row[:name] || row[:key]
              component_error!("Attribute must define 'value' property") unless row[:value]
            end
          end

          def call
            tag.table(**merge_attributes(css: 'table-attributes')) do
              tag.tbody do
                build(
                  attributes.map do |attribute|
                    tag.tr do
                      build(
                        [
                          tag.th { build_header(attribute) },
                          tag.td { build_value(attribute) }
                        ]
                      )
                    end
                  end
                )
              end
            end
          end

          def build_header(attribute)
            attribute[:name] ? build(attribute[:name], bind_to, **attribute) : build_sym(attribute[:key])
          end

          def build_value(attribute)
            build(attribute[:value], bind_to)
          end
        end
      end
    end
  end
end
