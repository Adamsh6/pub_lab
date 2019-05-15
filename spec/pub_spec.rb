require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')

class PubTest < Minitest::Test

  def setup

    @drink1 = Drink.new("Beer", 5, 3)
    @drink2 = Drink.new("Whiskey", 4, 6)
    @drink3 = Drink.new("Gin", 3, 5)
    @drinks = {
      @drink1 => 10,
      @drink2 => 5,
      @drink3 => 1
    }
    @pub = Pub.new("The Black Bull", 100, @drinks)
    # Above is pub's name, till and drinks
  end

  def test_pub_name
    assert_equal("The Black Bull", @pub.name)
  end

  def test_stock_level
    assert_equal(16, @pub.stock_level)
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

  def test_decrease_drink_stock_level
    @pub.decrease_drink_stock_level(@drink1)
    @pub.decrease_drink_stock_level(@drink1)
    @pub.decrease_drink_stock_level(@drink2)
    @pub.decrease_drink_stock_level(@drink2)
    @pub.decrease_drink_stock_level(@drink3)
    assert_equal(11, @pub.stock_level)
  end

  def test_get_stock_value
    assert_equal(73, @pub.stock_value)
  end

  def test_has_drink_left
    @pub.decrease_drink_stock_level(@drink3)
    assert_equal(false, @pub.has_drink_left?(@drink3))
    assert_equal(true, @pub.has_drink_left?(@drink1))
  end


end
