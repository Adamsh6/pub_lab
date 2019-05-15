require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')

class CustomerTest < Minitest::Test

  def setup
    @drink1 = Drink.new("Beer", 5, 3)
    @drink2 = Drink.new("Whiskey", 4, 6)
    @drink3 = Drink.new("Gin", 3, 5)
    @pub = Pub.new("The Black Bull", 100,[@drink1, @drink2, @drink3])
    @customer = Customer.new("Adam", 40, 27)
    @drunk_customer = Customer.new("Drunky", 0, 67, 11)
    @underage_customer = Customer.new("Little Timmy", 10, 17)
    @poor_customer = Customer.new("Nae pounds Pete", 1, 19)
    @almost_drunk_customer = Customer.new("Tispy Greg", 20, 22, 9)
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

def test_increase_alcohol_level
  @almost_drunk_customer.increase_alcohol_level(@drink1)
  assert_equal(true, @almost_drunk_customer.drunk?)
end


end
