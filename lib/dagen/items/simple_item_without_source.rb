require 'items/simple_item'

module Dagen

  module Item

    class SimpleItemWithoutSource < SimpleItem

      def give_me_data(value_to_use=nil)
        raise MethodNotImplementedException.new()
      end

    end

  end

end
