class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet, age, drunkeness=0)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness
  end

  def legal?
    if @age < 18
      return false
    end
    return true
  end

  def drunk?
    if @drunkeness > 10
      return true
    end
    return false
  end
end
