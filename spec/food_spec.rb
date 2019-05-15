require('minitest/autorun')
 require('minitest/rg')
 require_relative('../food')

 class FoodTest < Minitest::Test

def setup
@food = Food.new("Steak", 10, 8)
 end


def test_get_name
  assert_equal("Steak", @food.name)
end


def test_get_price
  assert_equal(10, @food.cost)
end

def test_get_rejuvenation_level
  assert_equal(8, @food.rejuvenation_level)
end




end
