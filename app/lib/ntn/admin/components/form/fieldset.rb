# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Form
        class Fieldset
          DELEGATED_METHOD_SUFFIXES = %w[input field].freeze

          def initialize(form, bind_to, namespace)
            @form = form
            @bind_to = bind_to
            @namespace = namespace
          end

          attr_reader :form, :bind_to, :namespace

          def fieldset(nested_bind_to, nested_namespace)
            new self.class(
              self,
              nested_bind_to,
              namespace ? "#{namespace}[#{nested_namespace}]" : nested_namespace
            )
          end

          def record_fieldset(nested_bind_to)
            fieldset(nested_bind_to, nested_bind_to.class.name.underscore)
          end

          # rubocop:disable Style/MissingRespondToMissing
          def method_missing(name, *, **, &)
            sufixe = name.to_s.split('_').last

            return form.send(name, *, **, &) unless DELEGATED_METHOD_SUFFIXES.include?(sufixe)

            form.send(
              name,
              *,
              bind_to:,
              namespace:,
              **,
              &
            )
          end
          # rubocop:enable Style/MissingRespondToMissing
        end
      end
    end
  end
end
