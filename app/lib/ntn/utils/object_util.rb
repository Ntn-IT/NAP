# frozen_string_literal: true

module Ntn
  module Utils
    module ObjectUtil
      extend self

      def lookup(object, property)
        return unless object

        sym_property = if property.is_a?(Symbol)
                         property
                       else
                         (
                                 property.respond_to?(:to_sym) ? property.to_sym : nil
                               )
                       end

        return object.send(sym_property) if sym_property && object.respond_to?(sym_property)

        return object[property.is_a?(Integer) ? property : property.to_i] if object.is_a?(Array)

        if object.is_a?(Hash)
          return object[property] if object.key?(property)

          cast_property = property.is_a?(Symbol) ? property.to_s : sym_property
          return object[cast_property] if object.key?(cast_property)
        end

        return object[property] if object.respond_to?(:[])

        nil
      end
    end
  end
end
