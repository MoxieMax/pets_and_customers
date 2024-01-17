require 'pry'
require './lib/pet'
require './lib/customer'

RSpec.describe Customer do
  before :each do
    @joel = Customer.new("Joel", 2)
    # @joel = Customer.new({name: "Joel", id: 2})
    
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@joel).to be_a(Customer)
    end
    
    it 'has attributes' do
      expect(@joel.name).to eq("Joel")
      expect(@joel.id).to eq(2)
      expect(@joel.pets).to eq([])
    end
    
    it 'can initialize a customer with pets' do
      molly = Pet.new({name: "Molly", type: :cat, age: 5})
      billy = Customer.new("Billy", 3, [molly])
      
      expect(molly).to be_a(Pet)
      expect(billy).to be_a(Customer)
      
      expect(billy.pets).to eq([molly])
      expect(billy.pets.count).to eq(1)
    end
  end
  
  describe '#adopt' do
    it 'adds pets to a customer' do
      expect(@joel.pets).to eq([])
      expect(@samson).to be_a(Pet)
      expect(@lucy).to be_a(Pet)
      
      @joel.adopt(@samson)
      @joel.adopt(@lucy)
      
      expect(@joel.pets).to eq([@samson, @lucy])
    end
  end
  
  describe '#outstanding_balance' do
    it 'defaults to 0' do
    end
  end
  
  describe '#charge' do
    it 'adds a balance to outstanding balance' do
      expect(@joel.outstanding_balance).to eq(0)
      
      @joel.charge(15)
      @joel.charge(7)
      
      expect(@joel.outstanding_balance).to eq(22)
    end
  end
  
end

