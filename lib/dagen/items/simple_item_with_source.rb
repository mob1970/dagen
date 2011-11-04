require 'items/simple_item'

module Dagen

  module Item

    class SimpleItemWithSource < SimpleItem

      attr_accessor :source

      ##
      #
      #
      def load_data()
        raise Exception.new("Method not implemented!!!!!")
      end

    end

  end
end
