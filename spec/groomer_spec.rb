require 'pry'
require './lib/pet'
require './lib/customer'
require './lib/groomer'

RSpec.describe Groomer do
  before :each do
    @pet11   = Pet.new({name: "Samson", type: :dog, age: 3})
    @pet12   = Pet.new({name: "Lucy", type: :cat, age: 12})
    @cus1    = Customer.new("Joel", 2, [@pet11, @pet12])
    
    @pet21   = Pet.new({name: "Moxie", type: :cat, age: 8})
    @pet22   = Pet.new({name: "Chuchu", type: :cat, age: 4})
    @cus2    = Customer.new("Chloe", 2, [@pet21, @pet22])
    
    @pet31   = Pet.new({name: "Daisy", type: :dog, age: 9})
    @pet32   = Pet.new({name: "Hobbes", type: :cat, age: 9})
    @cus3    = Customer.new("Max", 2, [@pet31, @pet32])
    
    @pet41   = Pet.new({name: "Molly", type: :cat, age: 5})
    @cus4    = Customer.new("Billy", 3, [@pet41])
    
    @bark    = Groomer.new({name: "Bark n Snip"})
    @wags    = Groomer.new({name: "Wags"}, [@cus4])
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
      expect(@pet41).to be_a(Pet)
      expect(@cus4).to be_a(Customer)
      expect(@wags).to be_a(Groomer)
      
      expect(@wags.customers).to eq([@cus4])
      expect(@wags.customers.count).to eq(1)
    end
  end
  
  describe '#add_customer' do
    it 'adds a customer to a groomer' do
      expect(@bark.customers).to eq([])
      
      @bark.add_customer(@cus1)
      
      expect(@bark.customers).to eq([@cus1])
    end
    
    it 'can add multiple customers in an array' do
      @bark.add_customer([@cus2, @cus3])
      
      expect(@bark.customers).to eq([@cus2, @cus3])
    end
  end
  
  describe '#pet_count' do
    it 'can return a count of the customer pets by type' do
      expect(@wags.pet_count(:cat)).to eq(1)
      expect(@wags.pet_count(:dog)).to eq(0)
      expect(@wags.pet_count(:snake)).to eq(0)
      
      pet42 = Pet.new({name: "Sheev", type: :snake, age: 1})
      
      @cus4.adopt(pet42)
      
      expect(@wags.pet_count(:snake)).to eq(1)
    end
  end
  
  describe '#outstanding_balances' do
    it 'returns customers with an outstanding balance' do
      @bark.add_customer([@cus1, @cus2, @cus3])
      
      @cus2.charge(5)
      @cus3.charge(10)
      @cus4.charge(15)
      
      expect(@bark.outstanding_balances).to eq([@cus2, @cus3])
      expect(@wags.outstanding_balances).to eq([@cus1])
      
    end
  end
  
end