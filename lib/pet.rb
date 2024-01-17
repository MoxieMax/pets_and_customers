class Pet
  attr_reader :name,
              :type,
              :age,
              :fed
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
    @age = attributes.fetch(:age)
    @fed = false
  end
  
  def fed?
    @fed
  end
  
  def feed
    @fed = true
  end
  
end