require 'items/simple_item_with_source'

module Dagen

  module Item

    class SimpleItemWithDatabaseSource < SimpleItemWithSource

      ##
      #
      #
      def initialize(connection, sql_sentence)
        @connection = connection
        @sql_sentence = sql_sentence
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