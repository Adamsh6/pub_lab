class Pub

attr_reader :name, :till

def initialize(name, till, drinks)
@name = name
@till = till
@drinks = drinks
end


def stock_level
  return @drinks.size
end

def add_to_till(drink)
  price = drink.cost
  @till += price
end


end
