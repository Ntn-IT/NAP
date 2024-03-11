# frozen_string_literal: true

module Ntn
  class HelperContext

    include Configurable

    def self.define_method_context(helper_module)
      context_class = self

      helper_module.define_method(context_class.context_name) do
        @__instance_contexts ||= {}
        context = @__instance_contexts[context_class]

        return context if context

        @__instance_contexts[context_class] = context_class.new(self)
      end
    end

    def self.t(key)
      key
    end

    configure(
      context_name: nil,
      attributes: nil,
    )

    def initialize(view_context)
      @view_context = view_context
    end

    attr_reader :view_context

    delegate_missing_to :view_context

    def fetch_attributes(*keys)
      return attributes.values if keys.empty?

      attributes.fetch_values(*keys)
    end

  end
end
