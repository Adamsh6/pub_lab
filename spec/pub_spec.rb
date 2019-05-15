require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')

class PubTest < Minitest::Test

  def setup

    @drink1 = Drink.new("Beer", 5, 3)
    @drink2 = Drink.new("Whiskey", 4, 6)
    @drink3 = Drink.new("Gin", 3, 5)
    @pub = Pub.new("The Black Bull", 100,[@drink1, @drink2, @drink3])
  end

  def test_pub_name
    assert_equal("The Black Bull", @pub.name)
  end

  def test_stock_level
    assert_equal(3, @pub.stock_level)
  end

  def test_till_amount
    assert_equal(100, @pub.till)
  end

  def test_add_to_till_by_drink
    @pub.add_to_till(@drink1)
    assert_equal(105, @pub.till)
  end

  def test_find_drink_by_name
    assert_equal(@drink3, @pub.find_drink_by_name("Gin"))
  end

end
