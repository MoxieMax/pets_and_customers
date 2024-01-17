class Groomer
  attr_reader :name,
              :customers
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @customers = []
  end
end