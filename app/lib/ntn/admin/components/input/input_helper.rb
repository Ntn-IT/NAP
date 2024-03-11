# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Input
        module InputHelper
          def input(type, name = nil, **, &)
            InputComponent.new(type:, name:, **, &)
          end

          def input_hidden(name = nil, **, &)
            input('hidden', name, **, &)
          end

          def text_input(name = nil, **, &)
            input('text', name, **, &)
          end

          def datetime_input(name = nil, **, &)
            input('datetime-local', name, **, &)
          end

          def textarea_input(name = nil, **, &)
            input('textarea', name, **, &)
          end

          def number_input(name = nil, **, &)
            input('number', name, **, &)
          end

          def file_input(name = nil, **, &)
            input('file', name, **, &)
          end

          def list_input(name = nil, **, &)
            input('list', name, **, &)
          end

          def checkbox_input(name = nil, **, &)
            input('checkbox', name, **, &)
          end

          def search_input(name = nil, **, &)
            input('search', name, **, &)
          end
        end
      end
    end
  end
end
