require 'items/simple_item_without_source'

class RandomNumberItem < Dagen::Item::SimpleItemWithoutSource

  ##
  #
  #
  def initialize(seed)
    super(seed)
  end

  ##
  #
  #
  def give_me_data(value_to_use=nil)
    @random.rand(value_to_use ? value_to_use : @default_max_value)
  end

end
