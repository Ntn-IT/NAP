# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Form
        class Scope
          DELEGATED_METHOD_SUFFIXES = %w[input field].freeze

          def initialize(form, bind_to, namespace)
            @form = form
            @bind_to = bind_to
            @namespace = namespace
          end

          attr_reader :form, :bind_to, :namespace

          def scope(bind_to, *paths, nested: true)
            namespace = nested && @namespace ? @namespace : paths.shift
            namespace += paths.map { "[#{_1}]" }.join

            scope = Scope.new(self, bind_to, namespace)

            build(yield(scope))
          end

          # ?? Si c'est une collection ? Pas sur que ca soit si pertient :/
          def record_scope(bind_to, *paths, nested: true, &)
            scope(bind_to, bind_to.class.name.underscore, *paths, reset:, &)
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
