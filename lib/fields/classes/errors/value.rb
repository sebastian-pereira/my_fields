module MyFields
  module Errors
    class Value
      attr_reader :name, :value
      
      def initialize(name, value)
        @name = name
        @value = value
      end
    end
      
  end
end