require "test/unit"

require '../lib/dagen/items/simple_item_without_source'

class TestSimpleItemWithoutSource < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def test_simple_item_without_source_without_seed
    t = Dagen::Item::SimpleItemWithoutSource.new()

    assert_not_nil t
    assert_raise(Dagen::Item::MethodNotImplementedException) { t.give_me_data() }
  end

end