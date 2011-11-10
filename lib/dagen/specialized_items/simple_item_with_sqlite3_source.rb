require 'items/simple_item_with_database_source'

module Dagen

  module SpecializedItem

    class SimpleItemWithSqlite3Source < Dagen::Item::SimpleItemWithDatabaseSource

      ##
      #
      #
      def initialize(connection, sql_sentence)
        super(connection, sql_sentence)
        @connection.results_as_hash = true
      end

      #
      #
      #
      def give_me_data(values_to_use=nil)
        raise Dagen::Item::NullParameterException.new() if !values_to_use

        result = []
        rows = @connection.execute(@sql_sentence, values_to_use)
        rows.each do |row|
          row_hashed = Hash.new()
          row.keys.each do |column_name|
            row_hashed[column_name] = row[column_name] if (column_name =~/[a-zA-z]+/)
          end
          result << row_hashed
        end

        result
      end

    end

  end

end