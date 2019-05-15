class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet, age, drunkeness=0)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness
  end
end
