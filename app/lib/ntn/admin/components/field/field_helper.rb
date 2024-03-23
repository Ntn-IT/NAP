# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Field
        module FieldHelper
          def field(type, name, **, &)
            FieldComponent.new(type:, name:, **, &)
          end

          def text_field(name = nil, **, &)
            field('text', name, **, &)
          end

          def password_field(name = nil, **, &)
            field('password', name, **, &)
          end

          def datetime_field(name = nil, **, &)
            field('datetime-local', name, **, &)
          end

          def textarea_field(name = nil, **, &)
            field('textarea', name, **, &)
          end

          def number_field(name = nil, **, &)
            field('number', name, **, &)
          end

          def file_field(name = nil, **, &)
            field('file', name, **, &)
          end

          def list_field(name = nil, **, &)
            field('list', name, **, &)
          end

          def checkbox_field(name = nil, **, &)
            field('checkbox', name, css: "form-check", **, &)
          end

          def search_field(name = nil, **, &)
            field('search', name, **, &)
          end
        end
      end
    end
  end
end
