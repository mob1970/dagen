require 'items/simple_item_with_database_source'
require 'mysql2'

module Dagen

  module SpecializedItem

    class SimpleItemWithMysqlSource < Dagen::Item::SimpleItemWithDatabaseSource

      ##
      #
      #
      def initialize(connection, sql_sentence)
        super(connection, sql_sentence)
      end

      #
      #
      #
      def give_me_data(values_to_use=nil)
        raise Dagen::Item::NullParameterException.new() if !values_to_use

        values_to_use = Array.new(1, values_to_use.to_s) if (values_to_use.is_a?(String) || values_to_use.is_a?(Integer))

        result = []
        # workaround
        modified_sql_sentence = @sql_sentence
        values_to_use.each do |value|
          modified_sql_sentence = modified_sql_sentence.sub('?', value.to_s)
        end

        @connection.query(modified_sql_sentence).each do |row|
          row_hashed = Hash.new()
          row.keys.each do |column_name|
            row_hashed[column_name] = row[column_name]
          end
          result << row_hashed
        end

        result
      end

    end

  end

end
