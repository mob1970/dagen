# Done because RubyMine has a bug which doesn't allow to set LOAD_PATH values
$LOAD_PATH.push("~/Development/dagen/lib/dagen/")

require "test/unit"
require 'items/simple_item_with_plain_text_source.rb'

class TestSimpleItemWithPlainTextSource < Test::Unit::TestCase

  ##
  #
  #
  def test_object_creation()
    item = Dagen::Item::SimpleItemWithPlainTextSource.new("files/simple_item_with_plain_text_source_one_column_without_caption.txt")

    assert_not_nil item
  end

  ##
  #
  #
  def test_file_with_one_column_and_not_captions()
    item = Dagen::Item::SimpleItemWithPlainTextSource.new("files/simple_item_with_plain_text_source_one_column_without_caption.txt")

    assert_equal 'Michael', item.give_me_data(0)
    assert_equal 'Jennifer', item.give_me_data(1)
    assert_equal 'John', item.give_me_data(2)
    assert_equal 'Mary', item.give_me_data(3)
    assert_equal 'James', item.give_me_data(4)
    assert_equal 'Lorie', item.give_me_data(5)
    assert_equal 'Christopher', item.give_me_data(6)
    assert_equal 'Scarlett', item.give_me_data(7)
    assert_equal 'Corin', item.give_me_data(8)
    assert_equal 'Stephanie', item.give_me_data(9)
  end

  ##
  #
  #
  def test_file_with_one_column_and_captions()
    item = Dagen::Item::SimpleItemWithPlainTextSource.new("files/simple_item_with_plain_text_source_one_column_with_caption.txt",
                                                          true)
    assert_equal 'Michael', item.give_me_data(0)['name']
    assert_equal 'Jennifer', item.give_me_data(1)['name']
    assert_equal 'John', item.give_me_data(2)['name']
    assert_equal 'Mary', item.give_me_data(3)['name']
    assert_equal 'James', item.give_me_data(4)['name']
    assert_equal 'Lorie', item.give_me_data(5)['name']
    assert_equal 'Christopher', item.give_me_data(6)['name']
    assert_equal 'Scarlett', item.give_me_data(7)['name']
    assert_equal 'Corin', item.give_me_data(8)['name']
    assert_equal 'Stephanie', item.give_me_data(9)['name']
  end

  ##
  #
  #
  def test_file_with_n_columns_and_captions()
    item = Dagen::Item::SimpleItemWithPlainTextSource.new("files/simple_item_with_plain_text_source_n_columns_with_caption.txt",
                                                          true, ';')
    assert_equal '2', item.give_me_data(1)['id']
    assert_equal 'Badalona', item.give_me_data(1)['name']
    assert_equal '1', item.give_me_data(1)['province_id']

  end

end