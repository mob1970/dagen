module Dagen

  module Item

    class PathNotProvidedException < Exception; end
    class NotEnoughValuesException < Exception; end
    class IncorrectValueException < Exception; end
    class MethodNotImplementedException < Exception; end
    class NullParameterException < Exception; end

    class SimpleItem

      ##
      #
      #
      def initialize(seed=nil)
        @default_seed_value = seed ? seed : Time.now.to_i
        @default_max_value = 200
        start_random()
      end

      #
      #
      #
      def give_me_data(value_to_use=nil)
        raise MethodNotImplementedException.new()
      end

      protected

      ##
      #
      #
      def start_random()
        @random = Random.new(@default_seed_value)
      end

    end

  end

end