# frozen_string_literal: true

module Ntn

  # Allow to define a default configuration for a class and potentially override it for these instances.
  # Each configuration property is accessible from class and instance methods
  # If the property is a boolean, the methods created will be of the predicate type (ending with a ?)
  # Configuration properties are resolved dynamically, so that when a property is overloaded from an initializer
  # for example, inherited classes are also affected by the change.
  #
  # This module defines:
  # - A static public `configure` method that can be used both when declaring the class
  #   but also from initializers to override certain values depending on the context
  # - A static method `config` to list class configuration properties
  # - A instance method `configure` to override static configuration
  # - A instance method `config` to list instance configuration properties
  module Configurable

    extend ActiveSupport::Concern

    def configure(**config)
      config_keys.each do |key|
        instance_variable_set(:"@#{ key }", config[key]) if config.key?(key)
      end

      self
    end

    def config
      config_keys.index_with do |key|
        send(key)
      end
    end

    def config_keys
      self.class.config_keys
    end

    class_methods do
      def configure(**config)
        ConfigBuilder.new(self, config).build

        self
      end

      def config
        config_keys.index_with do |key|
          send(key)
        end
      end

      def config_keys
        keys = @config_keys || []

        ancestors[1..].each do |ancestor|
          # Duck typing
          inherited_keys = ancestor.instance_variable_get(:@config_keys)
          keys += inherited_keys if inherited_keys
        end

        keys
      end
    end

  end

  class ConfigBuilder

    BOOLEANS = [true, false].freeze

    def initialize(configurable, config)
      @configurable = configurable
      @config = config
    end

    def build
      add_config_keys
      build_getters
    end

    private

    attr_reader :configurable, :config

    def add_config_keys
      keys = configurable.instance_variable_get(:@config_keys) || []
      configurable.instance_variable_set(:@config_keys, keys + config.keys)
    end

    def build_getters
      config.each do |key, value|
        add_class_getter(key, value)
        add_instance_getter(key, key)

        next unless BOOLEANS.include?(value)

        method_name = :"#{ key }?"
        add_class_getter(method_name, value)
        add_instance_getter(key, method_name)
      end
    end

    def add_class_getter(method_name, value)
      configurable.define_singleton_method(method_name) { value }
    end

    def add_instance_getter(key, method_name)
      instance_var = :"@#{ key }"

      configurable.define_method(method_name) do
        return instance_variable_get(instance_var) if instance_variable_defined?(instance_var)

        self.class.send(method_name)
      end
    end

  end

end
