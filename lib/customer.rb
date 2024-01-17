class Customer
  attr_reader :name,
              :id,
              :pets,
              :outstanding_balance
  
  def initialize(name, id, pets = [])
    @name = name
    @id = id
    @pets = pets
    @outstanding_balance = 0
  end
  
  def adopt(pet)
    @pets << pet
  end
  
  def charge(number)
    @outstanding_balance += number
  end
end