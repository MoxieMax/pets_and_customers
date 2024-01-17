class Groomer
  attr_reader :name,
              :customers
  
  def initialize(attributes, customers = [] )
    @name = attributes.fetch(:name)
    @customers = customers
  end
  
  def add_customer(customer)
    @customers << customer
  end
  
end