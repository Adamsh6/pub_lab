class Drink

  attr_reader :name, :cost, :alcohol

  def initialize (name, cost, alcohol)
    @name = name
    @cost = cost
    @alcohol = alcohol
  end
end
