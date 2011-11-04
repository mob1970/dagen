require "test/unit"

require '../lib/dagen/items/simple_item'

class TestSimpleItem < Test::Unit::TestCase

  def test_simple_item_without_seed()
    t = Dagen::Item::SimpleItem.new()

    assert_not_nil t
    assert_raise(Dagen::Item::MethodNotImplementedException) { t.give_me_data() }

  end

end