require 'items/simple_item_with_source'

module Dagen


  module Item

    class SimpleItemWithPlainTextSource < SimpleItemWithSource

      ##
      #
      #
      def initialize(file_path, titles_in_first_line=false, values_separator=nil)
        @file_path = file_path
        @titles_in_first_line = titles_in_first_line
        @values_separator = values_separator
        load_data()
      end

      ##
      #
      #
      def load_data()
        @source = Array.new()
        File.open(@file_path).each_line do |line|
          @source << format_data(line)
        end
      end

      protected

      ##
      #
      #
      def format_data(line)
        if line[@values_separator]
          values = line.strip().split(@values_separator)
        end
        line.chomp().strip()
      end

      ##
      #
      #
      def give_me_data(value_to_use=nil)
        raise IncorrectValueException.new() if value_to_use !~ /\d+/
        raise NotEnoughValuesException.new() if value_to_use && value_to_use.to_i >= line.length
        line[value_to_use ? value_to_use : @random.rand(line.length-1)]
      end

    end

  end

end