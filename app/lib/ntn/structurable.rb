# frozen_string_literal: true

module Ntn
  module Structurable
    extend ActiveSupport::Concern

    module Types
      include Dry.Types()
    end

    class Schema < ActiveSupport::Configurable::Configuration
      # Compiles reader methods so we don't have to go through method_missing.
      def self.compile_methods!(keys)
        keys.each do |key|
          class_eval <<-RUBY, __FILE__, __LINE__ + 1
            def #{key}; _get(#{key.inspect}); end
          RUBY
        end
      end

      def initialize(parent = nil)
        super(parent)

        @_parent = parent
      end

      def keys
        return super unless @_parent

        super + @_parent.keys
      end

      def key?(key)
        super || (@_parent ? @_parent.key?(key) : false)
      end

      def to_h
        return super unless @_parent

        @_parent.to_h.merge(super)
      end
    end

    module ClassMethods
      def schema
        @_schema ||= if respond_to?(:superclass) && superclass.respond_to?(:schema)
                       superclass.schema.inheritable_copy
                     else
                       # create a new "anonymous" class that will host the compiled reader methods
                       Class.new(Schema).new
                     end
      end

      # DOC
      def struct(**attrs)
        attrs.each do |key, value|
          dry_type = value.is_a?(Dry::Types::Type)
          value = value.default(nil) if dry_type && (value.optional? && !value.default?)

          # FIXME: Value must be of type ??
          schema.send(:"#{key}=", value)

          build_accessor(
            key,
            dry_type,
            value.is_a?(TrueClass) ||
            value.is_a?(FalseClass) ||
            (dry_type && value.inspect.match?(/TrueClass|FalseClass/))
          )
        # rescue StandardError
        #   binding.pry
        #   raise
        end

        schema.compile_methods!
      end

      def configure(**)
        struct(**)
      end

      def build_accessor(name, dry_type, predicate)
        raise NameError.new('invalid schema attribute name') unless /\A[_A-Za-z]\w*\z/.match?(name)

        class_eval(<<~RUBY, __FILE__, __LINE__)
          def #{name}
            return @#{name} if defined?(@#{name})
            schema.#{name}#{dry_type ? '[]' : ''}
          end
        RUBY

        class_eval(<<~RUBY, __FILE__, __LINE__)
          def #{name}=(value)
            @#{name} = #{dry_type ? "schema.#{name}[value]" : 'value'}
          end
        RUBY

        return unless predicate

        class_eval("def #{name}?;#{name};end", __FILE__, __LINE__)
      end
    end

    def schema
      self.class.schema
    end

    def structure(**attrs)
      attrs.each do |key, value|
        send(:"#{key}=", value) if schema.key?(key)
      end
    end

    def configure(**)
      structure(**)
    end
  end
end
