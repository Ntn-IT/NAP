# frozen_string_literal: true

module Ntn
  class Component < ViewComponent::Base
    include Structurable
    include ViewHelper
    include Admin::ViewHelper

    class ComponentError < StandardError; end

    struct(
      css: Types::String.default { '' },
      data: Types::Hash.optional,
      yield_block: Types.Instance(Proc).optional
    )

    def self.t(key, *_args, **_kwargs)
      key
    end

    def initialize(**attrs)
      structure(**attrs)
      @extra_attributes = attrs.slice(*(attrs.keys - schema.keys))

      validate!
    end

    attr_reader :extra_attributes

    def validate!; end

    def vc
      @__vc_original_view_context
    end

    def render_in(view_context, &block)
      render_block = block || yield_block

      super(view_context, &render_block)
    end

    # Hack to passe arguments like nested components to the component block
    # https://github.com/ViewComponent/view_component/blob/b1aee6d90438de717e725a41abade1bfc9ea1f3a/lib/view_component/base.rb
    def content(*args)
      @__vc_content_evaluated = true
      return @__vc_content if defined?(@__vc_content)

      args = [self] if args.empty?

      @__vc_content =
        if __vc_render_in_block_provided?
          view_context.capture(*args, &@__vc_render_in_block)
        elsif __vc_content_set_by_with_content_defined?
          @__vc_content_set_by_with_content
        end
    end

    def merge_attributes(css: nil, data: {}, **kwargs)
      {
        class: "#{css} #{self.css}".strip || nil,
        data: data.merge(self.data || {}),
        **kwargs
      }
    rescue StandardError
      binding.pry
    end

    def build_attributes(css: nil, data: {}, **)
      super(**merge_attributes(css:, data:, **))
    end

    def component_error!(message, err = nil)
      component_error = ComponentError.new(message)
      component_error.set_backtrace(err.backtrace) if err

      raise component_error
    end

    # rubocop:disable Style/MissingRespondToMissing
    def method_missing(name, ...)
      vc.send(name, ...)
    end
    # rubocop:enable Style/MissingRespondToMissing

    def component?(obj)
      obj.is_a?(Component)
    end
  end
end
