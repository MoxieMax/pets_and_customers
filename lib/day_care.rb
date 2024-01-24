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
    
    # @customers.find_all { |customer| customer.find_all {|pets| } pets }
    
    # @customer.find_all do customer
    #   customer.pets.map do pet
    #     [] << pet
    #   end
    # end
    # @customers.find_all { |customer| customer.outstanding_balance > 0 }
    # binding.pry
    # binding.pry
    # @customers.each do
    #   binding.pry
    #   customer.pets.map do
    #     [] << pet
    #   end
    # end
    # binding.pry
  end
  
  def hungry_pets
    
  end
end