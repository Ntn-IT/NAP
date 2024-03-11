# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Table
        class TableComponent < Component
          configure(
            rows: nil,
            attributes: nil,
            actions: nil
          )

          def validate!
            component_error!('Attributes must be a Array') unless attributes.is_a?(Array)

            attributes.each do |column|
              component_error!('Attribute must be an Hash') unless column.is_a?(Hash)
              unless column[:name] || column[:key]
                component_error!("Attribute must define 'name' or a 'key' property")
              end
              component_error!("Attribute must define 'value' attribute") unless column[:value]
            end
          end

          def call
            return build_no_result unless rows.present?

            tag.table(**merge_attributes(css: 'trestle-table')) do
              build(
                [
                  build_headers,
                  buil_rows
                ]
              )
            end
          end

          def build_no_result
            build(element(css: 'empty-result')) do
              t('No results available')
            end
          end

          def build_headers
            tag.thead do
              tag.tr do
                build(
                  attributes.map do |column|
                    tag.th { build_header(column) }
                  end + [build_header_actions]
                )
              end
            end
          end

          def build_header(column)
            column[:name] ? build(column[:name], **column) : build_sym(column[:key])
          end

          def build_header_actions
            return unless actions.present?

            tag.th {}
          end

          def buil_rows
            tag.tbody do
              build(
                rows.map do |row|
                  tag.tr do
                    build_row(row)
                  end
                end
              )
            end
          end

          def build_row(row)
            build(
              attributes.map do |column|
                tag.td do
                  build_cell(row, column)
                end
              end + [build_cell_actions(row)]
            )
          end

          def build_cell(row, column)
            build(column[:value], row, **column)
          end

          def build_cell_actions(row)
            tag.td(class: 'action') do
              tag.div(class: 'flex-row') do
                build(actions, row)
              end
            end
          end
        end
      end
    end
  end
end
