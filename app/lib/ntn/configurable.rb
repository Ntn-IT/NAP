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
      configurables.each do |key|
        instance_variable_set(:"@#{key}", config[key]) if config.key?(key)
      end

      self
    end

    def config
      configurables.index_with do |key|
        send(key)
      end
    end

    def extra_config(**config)
      config.slice(*(config.keys - configurables))
    end

    def configurables
      self.class.configurables
    end

    class_methods do
      def configure(**config)
        ConfigBuilder.new(self, config).build

        self
      end

      def config
        return @config if defined?(@config)

        parent = ancestors[1]
        return unless parent.respond_to?(:config)

        config = parent.config

        config.is_a?(Class) && config < Config ? config : nil
      end

      def configurables
        config&.configurables
      end
    end
  end

  class Config
    def self.configurables
      keys = (@configurables || []).dup

      ancestors[1..].each do |ancestor|
        break unless ancestor < Config

        keys.push(*ancestor.instance_variable_get(:@configurables))
      end

      keys
    end
  end

  class ConfigBuilder
    BOOLEANS = [true, false].freeze

    def initialize(configurable, config)
      @configurable = configurable
      @config = config
    end

    def build
      define_class_config
      build_getters
      define_class_configurables
    end

    private

    attr_reader :configurable, :config, :class_config

    def define_class_config
      @class_config = configurable.instance_variable_get(:@config)

      return @class_config if @class_config

      inherit_class_config = configurable.config || Config

      @class_config = Class.new(inherit_class_config)

      configurable.instance_variable_set(:@config, @class_config)
    end

    def define_class_configurables
      configurables = class_config.instance_variable_get(:@configurables) || []
      class_config.instance_variable_set(:@configurables, configurables + config.keys)
    end

    def build_getters
      config.each do |key, value|
        add_class_config_getter(key, value)
        add_instance_getter(key, key)

        next unless BOOLEANS.include?(value)

        method_name = :"#{key}?"
        add_class_config_getter(method_name, value)
        add_instance_getter(key, method_name)
      end
    end

    def add_class_config_getter(method_name, value)
      class_config.define_singleton_method(method_name) { value }
    end

    def add_instance_getter(key, method_name)
      return if class_config.configurables&.include?(key)

      # FIXME: tester si méthode existe pas déjà
      instance_var = :"@#{key}"

      configurable.define_method(method_name) do
        return instance_variable_get(instance_var) if instance_variable_defined?(instance_var)

        self.class.config.send(method_name)
      end
    end
  end
end
