# frozen_string_literal: true

module Ntn
  class HelperContext

    TABLE_ATTRIBUTE_KEYS = %i[key name value]
    FIELD_ATTRIBUTE_KEYS = %i[key label field]

    class_attribute :context_name
    class_attribute :context_attributes, default: {}

    def self.inherited(subclass)
      subclass.context_attributes = self.context_attributes.dup
    end

    def self.define_context_method(helper_module)
      context_class = self

      helper_module.define_method(context_name) do
        @__instance_contexts ||= {}
        context = @__instance_contexts[context_class]

        return context if context

        @__instance_contexts[context_class] = context_class.new(
          is_a?(HelperContext) ? view_context : self
        )
      end
    end

    def self.attributes(**attrs)
      attrs.each do |key, config|
        attribute(key, **config)
      end
    end

    def self.attribute(key, **config)
      config[:key] = key
      context_attributes[key] = config
      ins_var = :"@#{key}"

      define_method(key) do
        return instance_variable_get(ins_var) if instance_variable_defined?(ins_var) 

        instance_variable_set(
          ins_var, 
          ActiveSupport::Configurable::Configuration.new(context_attributes[key])
        )
      end
    end

    def self.bind_attribute(key, **override, &)
      config = context_attributes[key].dup.merge(**override)

      init_value = config[:value]
      init_field = config[:field]

      if init_value && init_value.is_a?(Proc)
        config[:value] = proc { |vc, rec| init_value.call(vc, yield(rec)) }
      end
      
      if init_field && init_field.is_a?(Proc)
        config[:field] = proc { |vc, rec| init_field.call(vc, yield(rec)) } 
      end
  
      config
    end

    def self.t(key)
      key
    end

    def initialize(view_context)
      @view_context = view_context
    end

    attr_reader :view_context
    alias vc view_context

    delegate_missing_to :view_context

    def table_attributes(*keys, except: [])
      attrs = 
        if keys.empty? && except.empty?
          context_attributes.values
        elsif except.empty?
          context_attributes.fetch_values(*keys)
        else
          context_attributes.except(*except).values
        end

      map_attribute_hash(attrs, TABLE_ATTRIBUTE_KEYS)
    end

    def form_fields(form, *keys, except: [])
      attrs = 
        if keys.empty? && except.empty?
          context_attributes.values
        elsif except.empty?
          context_attributes.fetch_values(*keys)
        else
          context_attributes.except(*except).values
        end

      attrs.map do |att| 
        proc do |vc| 
          field = att[:field].call(vc, form) 
          field.label = att[:name]
          field
        end
      end
    end

    private

    def map_attribute_hash(attrs, keys)
      attrs.map do |att|
        keys.each_with_object({}) do |key, hsh|
          hsh[key] = att[key]
        end
      end
    end

  end
end
