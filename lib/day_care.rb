class DayCare
  attr_reader :name,
              :customers
  
  def initialize(attributes, customers = [])
    @name = attributes.fetch(:name)
    @customers = customers
  end
  
  def add_customer(customer)
    @customers << customer
    @customers.flatten!
  end
  
  def customer_pets(customer)
    customer.pets
  end
  
  def find_customer(id)
    @customers.select {|customer| customer.id == id }
  end
  
  def all_pets
    @customers.flat_map(&:pets)
  end
  
  def hungry_pets
    all_pets.select {|pet| pet.fed? == false} 
  end
end