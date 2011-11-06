require 'items/simple_item_with_source'

module Dagen


  module Item

    class SimpleItemWithPlainTextSource < SimpleItemWithSource

      ##
      #
      #
      def initialize(file_path, titles_in_first_line=false, separator=nil)
        super()
        raise PathNotProvidedException.new() if !file_path
        @file_path = file_path
        @titles_in_first_line = titles_in_first_line
        @separator = separator
        load_data()
      end

      ##
      #
      #
      def load_data()
        @source = Array.new()
        first_line = @titles_in_first_line
        File.open(@file_path).each_line do |line|
          if first_line
            @column_titles = line.chomp().split(@separator)
            first_line = false
          else
            @source << format_data(line)
          end
        end
      end

      ##
      #
      #
      def give_me_data(value_to_use=nil)
        raise IncorrectValueException.new() if !value_to_use =~ /\d+/
        raise NotEnoughValuesException.new() if value_to_use && value_to_use.to_i >= @source.length
        @source[value_to_use ? value_to_use.to_i : @random.rand(@source.length-1)]
      end

      protected

      ##
      #
      #
      def format_data(line)
        if @separator && line[@separator]
          values = line.chomp().strip().split(@separator)
        else
          values = [line.chomp().strip()]
        end

        if @column_titles
          result = Hash.new()
          (0...@column_titles.length).each do |index|
            result[@column_titles[index]] = values[index]
          end
          result
        else
          line.chomp().strip()
        end
      end

    end

  end

end