require 'items/simple_item_with_plain_text_source'

class Name < Dagen::Item::SimpleItemWithPlainTextSource
  def initialize(lang)
     super("/home/miquel/Development/dagen/test/names_#{lang}.txt")
  end

  def give_me_data()
    output=''
    @source.each do |item|
       output += item + "\n"
    end
    output
  end
end

n = Name.new('ca')
puts n.give_me_data()