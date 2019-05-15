require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')
require_relative('../food')

class CustomerTest < Minitest::Test

  def setup
    @drink1 = Drink.new("Beer", 5, 3)
    @drink2 = Drink.new("Whiskey", 4, 6)
    @drink3 = Drink.new("Gin", 3, 5)
    @drinks = {@drink1 => 10, @drink2 => 5, @drink3 => 1}
    @pub = Pub.new("The Black Bull", 100, @drinks)
    @customer = Customer.new("Adam", 40, 27)
    @drunk_customer = Customer.new("Drunky", 20, 67, 11)
    @underage_customer = Customer.new("Little Timmy", 10, 17)
    @poor_customer = Customer.new("Nae pounds Pete", 1, 19)
    @almost_drunk_customer = Customer.new("Tispy Greg", 20, 22, 9)
    @food = Food.new("Steak", 10, 8)
  end

  def test_get_name
    assert_equal("Adam", @customer.name)
  end

  def test_get_cash
    assert_equal(40, @customer.wallet)
  end

  def test_is_legal__true
    assert_equal(true, @customer.legal?)
  end

  def test_is_legal__false
    assert_equal(false, @underage_customer.legal?)
  end

  def test_is_drunk__true
    assert_equal(true, @drunk_customer.drunk?)
  end

  def test_is_drunk__false
    assert_equal(false, @customer.drunk?)
  end

  def test_buy_drink
    @customer.buy_drink("Whiskey", @pub)
    assert_equal(36, @customer.wallet)
    assert_equal(104, @pub.till)
    assert_equal(15, @pub.stock_level)
    @almost_drunk_customer.buy_drink("Beer", @pub)
    assert_equal(true, @almost_drunk_customer.drunk?)
  end

def test_buy_under_drink_age_limit
  assert_equal("Too young, pal", @underage_customer.buy_drink("Beer", @pub))
end

def test_buy_drink_fail
  assert_equal("Nut", @poor_customer.buy_drink("Whiskey", @pub))
  end


def test_buy_drink_non_existent
  assert_equal("We don't sell that piss here", @customer.buy_drink("Advocaat",@pub))
end

def test_buy_drink_drunk
  assert_equal("Nut", @drunk_customer.buy_drink("Beer", @pub))
end

def test_buy_drink_none_left
  @pub.decrease_drink_stock_level(@drink3)
  assert_equal("Sorry mate", @customer.buy_drink("Gin", @pub))
end

def test_increase_alcohol_level
  @almost_drunk_customer.increase_alcohol_level(@drink1)
  assert_equal(true, @almost_drunk_customer.drunk?)
end


def test_by_food
  @drunk_customer.buy_food(@food, @pub)
  assert_equal(10, @drunk_customer.wallet)
  assert_equal(110, @pub.till)
  assert_equal(false, @drunk_customer.drunk?)
end
end
