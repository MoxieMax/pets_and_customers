require 'pry'
require './lib/pet'
require './lib/customer'
require './lib/groomer'

RSpec.describe Groomer do
  before :each do
    @bark = Groomer.new({name: "Bark n Snip"})
    
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    
    @joel = Customer.new("Joel", 2, [@samson, @lucy])
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@bark).to be_a(Groomer)
    end
    
    it 'has attributes' do
      expect(@bark.name).to eq("Bark n Snip")
      expect(@bark.customers).to eq([])
    end
    
    it 'can initialize with customers' do
      molly = Pet.new({name: "Molly", type: :cat, age: 5})
      billy = Customer.new("Billy", 3, [molly])
      groomer = Groomer.new({name: "Wags"}, [billy])
      
      expect(molly).to be_a(Pet)
      expect(billy).to be_a(Customer)
      expect(groomer).to be_a(Groomer)
      
      expect(groomer.customers).to eq([billy])
      expect(groomer.customers.count).to eq(1)
      # binding.pry
    end
  end
  
  describe '#add_customer' do
    
  end
  
end