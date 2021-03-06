class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end


  def stock_level
    total_stock = 0
    @drinks.each_value {|amount| total_stock += amount}
    return total_stock
  end

  def add_to_till(item)
    price = item.cost
    @till += price
  end

  def find_drink_by_name(name)
    @drinks.each_key {|drink| return drink if drink.name ==name}
    return nil
  end

  def decrease_drink_stock_level(drink)
    @drinks[drink] -= 1
  end

  def stock_value
    stock_value_total = 0
    @drinks.each {|drink, amount| stock_value_total += (drink.cost * amount)}
    return stock_value_total
  end

  def has_drink_left?(drink)
    if @drinks[drink] == 0
      return false
    end
    return true
  end


end
