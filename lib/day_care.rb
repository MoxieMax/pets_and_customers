class DayCare
  attr_reader :name,
              :customers
  
  def initialize(attributes, customers = [])
    @name = attributes.fetch(:name)
    @customers = customers
  end
end