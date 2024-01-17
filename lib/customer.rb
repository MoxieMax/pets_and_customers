class Customer
  attr_reader :name,
              :id,
              :pets
  
  def initialize(name, id)
    @name = name
    @id = id
    @pets = []
  end
end