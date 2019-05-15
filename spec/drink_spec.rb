require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')


class TestDrink < Minitest::Test

  def setup

    @drink = Drink.new("Beer", 3, 5)
# Above is the drink name and the price
  end


  def test_get_name
    assert_equal("Beer", @drink.name)
  end

  def test_get_price
    assert_equal(3, @drink.cost)
  end

  def test_get_alcohol_level
    assert_equal(5, @drink.alcohol)
  end
end
