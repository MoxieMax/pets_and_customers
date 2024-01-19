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
  
  def count_pets(pet_type)
    @pets.count { |pet| pet.type == pet_type }
  end
end