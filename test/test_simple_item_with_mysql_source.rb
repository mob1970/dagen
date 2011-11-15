# Done because RubyMine has a bug which doesn't allow to set LOAD_PATH values
$LOAD_PATH.push("~/Development/dagen/lib/dagen/")

require "test/unit"
require 'specialized_items/simple_item_with_mysql_source'
require 'mysql2'

class TestSimpleItemWithMysqlSource < Test::Unit::TestCase

  def test_select_by_id()
    connection = Mysql2::Client.new(:host => 'localhost',
                                    :username => 'test_user',
                                    :password => 'test_user',
                                    :database => 'dagen_test')
    sql_sentence = 'select * from cities where id = ?'
    item = Dagen::SpecializedItem::SimpleItemWithMysqlSource.new(connection, sql_sentence)

    values = item.give_me_data(1)
    assert_equal "Badalona", values[0]['name']
    values = item.give_me_data(2)
    assert_equal "Sant Cugat del Valles", values[0]['name']
    values = item.give_me_data(3)
    assert_equal "Blanes", values[0]['name']
    values = item.give_me_data(4)
    assert_equal "Lloret", values[0]['name']
  end

end