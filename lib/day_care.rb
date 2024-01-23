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
end