# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Input
        class InputComponent < Component
          configure(
            type: 'text',
            name: nil,
            id: nil,
            bound_attribute: nil,
            namespace: nil,
            value: nil,
            placeholder: nil,
            disabled: false,
            readonly: false,
            step: nil,
            min: nil,
            max: nil,
            checked: nil,
            autocomplete: 'on',
            options: nil,
            multiple: false,
            optional: true,
            rows: 10,
            bind_to: nil
          )

          def call
            type_str = type.to_s

            return build_hidden if type_str == 'hidden'
            return build_checkbox if type_str == 'checkbox'
            return build_radio if type_str == 'radio'
            return build_list if type_str == 'list'
            return build_number if type_str == 'number'
            return build_textarea if type_str == 'textarea'

            build_text_like
          end

          def build_hidden
            tag.input(
              **merge_attributes(
                type: 'hidden',
                id:,
                name:,
                value:
              )
            )
          end

          def build_checkbox
            tag.input(
              **merge_attributes(
                type:,
                css: 'form-check-input',
                id:,
                name:,
                checked: checkbox_checked,
                value:,
                disabled:,
                readonly:
              )
            )
          end

          def build_radio
            tag.input(
              **merge_attributes(
                type:,
                css: 'form-control',
                id:,
                name:,
                checked: radio_checked,
                value:,
                disabled:,
                readonly:
              )
            )
          end

          def build_list
            tag.select(
              **merge_attributes(
                type:,
                css: 'form-control',
                id:,
                name:,
                placeholder:,
                value:,
                disabled:,
                autocomplete:,
                multiple:,
                readonly:
              )
            ) { build_list_options }
          end

          def build_list_options
            build(
              [
                optional ? tag.option { '' } : nil,
                options.map do |option|
                  opt_value =
                    if option.is_a?(Hash)
                      option[:value]
                    else
                      option.is_a?(Array) ? option[0] : option
                    end
                  label =
                    if option.is_a?(Hash)
                      option[:label] || opt_value
                    else
                      option.is_a?(Array) ? option[1] : opt_value
                    end

                  tag.option(
                    value: opt_value,
                    selected: value == opt_value || (value.is_a?(Array) && value.include?(opt_value))
                  ) { label }
                end
              ]
            )
          end

          def build_number
            tag.input(
              **merge_attributes(
                type:,
                css: 'form-control',
                id:,
                name:,
                placeholder:,
                value:,
                disabled:,
                readonly:,
                step:,
                min:,
                max:,
                autocomplete:
              )
            )
          end

          def build_textarea
            tag.textarea(
              **merge_attributes(
                css: 'form-control',
                id:,
                name:,
                placeholder:,
                disabled:,
                readonly:,
                autocomplete:,
                rows:
              )
            ) { value }
          end

          # <input class="form-control" type="text" name="movie[title]" id="movie_title">

          def build_text_like
            tag.input(
              **merge_attributes(
                type:,
                css: 'form-control',
                id:,
                name:,
                placeholder:,
                value:,
                disabled:,
                readonly:,
                autocomplete:
              )
            )
          end

          def checkbox_checked
            return @checked if defined?(@checked)

            value == 'on' || value == 'true' || value == true || value == 1 || @value == '1'
          end

          def radio_checked
            return @checked if defined?(@checked)

            value == binded_value
          end

          def bound_attribute
            @bound_attribute ||= @name
          end

          def name
            return "#{@name}#{multiple ? '[]' : ''}" unless namespace

            "#{namespace}[#{@name}]#{multiple ? '[]' : ''}"
          end

          def value
            format_value(defined?(@value) ? @value : binded_value)
          end

          def binded_value
            return @binded_value if defined?(@binded_value)

            @binded_value = Ntn::Utils::ObjectUtil.lookup(bind_to, bound_attribute)
          end

          def format_value(value)
            return unless value

            return value.strftime('%F') if type == 'date'

            value
          end
        end
      end
    end
  end
end
