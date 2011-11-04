require 'items/simple_item_with_source'

module Dagen

  module Item

    class SimpleItemWithDatabaseSource < SimpleItemWithSource

      ##
      #
      #
      def initialize(connection)
        @connection = connection
      end

      ##
      #
      #
      def load_data()
        # It have not to do anything!!!
      end

    end

  end

end