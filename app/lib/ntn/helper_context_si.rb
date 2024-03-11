# frozen_string_literal: true

module Ntn
  class HelperContextSi
    include Configurable
    class_attribute :context_name
    
    def self.define_context_method(helper_module)
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

    def self.bind_attribute(key, &)
      attr = config.attributes[key].dup
      init_value = attr[:value]

      attr[:value] = proc do |vc, rec|
        init_value.call(vc, yield(rec))
      end

      attr
    end

    configure(
      attributes: nil
    )

    def initialize(view_context)
      @view_context = view_context
    end

    attr_reader :view_context
    alias vc view_context

    delegate_missing_to :view_context

    def attributes(*keys, except: [])
      attrs = self.class.config.attributes

      return attrs.values if keys.empty? && except.empty?
      return attrs.fetch_values(*keys) if except.empty?

      attrs.except(*except).values
    end
  end
end
