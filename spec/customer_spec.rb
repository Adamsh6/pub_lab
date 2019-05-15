require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')

class CustomerTest < Minitest::Test

  def setup
    @customer = Customer.new("Adam", 40, 27)
    @drunk_customer = Customer.new("Drunky", 0, 67, 10)
    @underage_customer = Customer.new("Little Timmy", 10, 17)
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
    assert_equal(true, @customer.drunk?)
  end

  def test_is_drunk__false
    assert_equal(false, @customer.drunk?)
  end



end
