# frozen_string_literal: true

module Ntn
  module ViewHelper
    class BuildError < StandardError; end

    def t(key, *_args, **_kwargs)
      key
    end

    # Join several strings or array of strings into one
    def html_join(*elements)
      elements.flatten!
      elements.compact!

      safe_join(elements)
    end

    # Formats attributes and renders them as html strings
    def build_attributes(**kwargs)
      array_attrs =
        format_attributes_rec(kwargs).map do |name, value|
          "#{name}=\"#{value.to_s.gsub('"', '\"')}\""
        end

      array_attrs.join(' ').html_safe
    end

    # Formatting symbol for html display
    def build_sym(key)
      return unless key

      key.to_s.capitalize.gsub(/_|-/, ' ')
    end

    def base_resource
      nil
    end

    # FIXME a dégager
    # Returns the url of an action based on a resource model
    def build_model_url(model, base_resource: self.base_resource, index: false, action: nil, params: nil)
      return unless model

      klass = model.is_a?(Class) ? model : model.class
      # FIXME
      prefix_action = action&.to_sym == :new || action&.to_sym == :edit
      str_action = action ? "#{action}_" : ''

      send(
        "#{prefix_action ? str_action : ''}#{base_resource ? "#{base_resource}_" : ''}" \
        "#{klass.name.underscore.gsub("/", "_")}#{index ? 's' : ''}_" \
        "#{!prefix_action ? str_action : ''}path",
        params
      )
    end

    # Builds object in html format
    def build(object = nil, *args, **kwargs, &)
      component = build_object(object, *args, **kwargs)

      if component.is_a?(Array)
        return html_join(
          component.map do |item|
            item.is_a?(ViewComponent::Base) ? render(item, &) : item
          end
        )
      end

      component.is_a?(ViewComponent::Base) ? render(component, &) : component
      # rescue StandardError => e
      #   raise if e.is_a?(BuildError)

      #   msg =
      #     "Build error in: '#{ self.class }'\n" \
      #     "message: #{ e.message }\n" \
      #     "object: #{ (component || object).inspect.truncate(1_000) }\n" \
      #     "args: #{ args.inspect.truncate(1_000) }\n" \
      #     "kwargs: #{ kwargs.inspect.truncate(1_000) }"

      #   err = BuildError.new(msg)
      #   err.set_backtrace(e.backtrace)

      #   raise err
    end

    # Attempts to build one or more components based on object, kwarg and block data
    #
    # Return the object if it is an String or a ViewComponent::Base or nil
    # Returns the build result for each table element if the object is an array
    #
    # Otherwise, calls recursively this method with as object:
    # The result call to the self method name if object is a symbol
    # The result call if object is a proc
    # Otherwise, return the inspect return method on the object
    def build_object(object = nil, *, **)
      return if object.nil?
      return object if object.is_a?(ViewComponent::Base)
      return object.html_safe if object.is_a?(String)

      return object.map { |item| build_object(item, *, **) } if object.is_a?(Array)
      return build_object(object.call(self, *, **), *, **) if object.is_a?(Proc) || object.is_a?(Method)
      return build_object(send(object, *, **), *, **) if object.is_a?(Symbol)

      object.inspect
    end

    # rubocop:disable Style/MissingRespondToMissing
    def method_missing(name, ...)
      if name.to_s.start_with?('build_')
        method = :"#{name.to_s.gsub(/^build_/, '')}"

        return build(send(method, ...))
      end

      super
    end
    # rubocop:enable Style/MissingRespondToMissing

    private

    def format_attributes_rec(attrs, formated_attrs = {}, base_keys = [])
      attrs.each do |key, value|
        next if value.nil?

        base_keys << key.to_s.tr('_', '-')

        if value.is_a?(Hash)
          format_attributes_rec(value, formated_attrs, base_keys)
        else
          formated_attrs[base_keys.join('-')] = value
        end

        base_keys.pop
      end

      formated_attrs
    end
  end
end
