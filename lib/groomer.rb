class Groomer
  attr_reader :name,
              :customers
  
  def initialize(attributes, customers = [] )
    @name = attributes.fetch(:name)
    @customers = customers
  end
  
  def add_customer(customer)
    @customers << customer
    @customers.flatten!
  end
  
  def pet_count(type)
    @customers.sum { |customer| customer.count_pets(type) }
  end
  
  def outstanding_balances
    # binding.pry
    @customers.find_all { |customer| customer.outstanding_balance > 0 }
  end
end