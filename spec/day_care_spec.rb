require 'pry'
require './lib/pet'
require './lib/customer'
require './lib/day_care'

RSpec.describe DayCare do
  before :each do
    @pet11   = Pet.new({name: "Jim", type: :snake, age: 3})
    @pet12   = Pet.new({name: "Bounce", type: :chicken, age: 4})
    @cus1    = Customer.new("Nora", 1, [@pet11, @pet12])
    
    @pet21   = Pet.new({name: "Moxie", type: :cat, age: 8})
    @pet22   = Pet.new({name: "Chuchu", type: :cat, age: 4})
    @cus2    = Customer.new("Chloe", 2, [@pet21, @pet22])
    
    @pet31   = Pet.new({name: "Daisy", type: :dog, age: 8})
    @pet32   = Pet.new({name: "Hobbes", type: :cat, age: 9})
    @cus3    = Customer.new("Max", 3, [@pet31, @pet32])
    
    @pet41   = Pet.new({name: "Molly", type: :cat, age: 5})
    @cus4    = Customer.new("Billy", 4, [@pet41])
    
    @fine    = DayCare.new({name: "Fine Whine and Lickers"})
    @bark    = DayCare.new({name: "Barking Bad"}, [@cus3])
  end
  
  describe 'initialize' do
    it 'exists' do
      expect(@fine).to be_a(DayCare)
      expect(@bark).to be_a(DayCare)
    end
    
    it 'has attributes' do
      expect(@fine.name).to eq("Fine Whine and Lickers")
      expect(@fine.name).to_not eq("Barking Bad")
      expect(@fine.customers).to eq([])
      
      expect(@bark.name).to eq("Barking Bad")
      expect(@bark.name).to_not eq("Fine Whine and Lickers")
      expect(@bark.customers).to eq([@cus3])
    end
  end
  
  describe '#add_customer' do
    it 'adds a customer to the customers array' do
      expect(@fine.customers).to eq([])
      expect(@bark.customers).to eq([@cus3])
      @fine.add_customer(@cus1)
      
      expect(@fine.customers).to eq([@cus1])
      expect(@bark.customers).to eq([@cus3])
    end
    
    it 'can add multiple customers at once' do
      expect(@fine.customers).to eq([])
      
      @fine.add_customer([@cus1, @cus2])
      
      expect(@fine.customers).to eq([@cus1, @cus2])
    end
  end
  
  describe 'everything after #add_customer' do
    before :each do
      @fine.add_customer([@cus1, @cus2])
      @bark.add_customer([@cus4])
    end
  
    describe '#customer_pets' do
      it 'lists pets for a specified customer' do
        expect(@fine.customer_pets(@cus1)).to eq([@pet11, @pet12])
        expect(@fine.customer_pets(@cus2)).to eq([@pet21, @pet22])
        
        expect(@bark.customer_pets(@cus3)).to eq([@pet31, @pet32])
        expect(@bark.customer_pets(@cus4)).to eq([@pet41])
      end
    end
    
    describe '#find_customer' do
      it 'returns a customer with a given id' do
        expect(@fine.find_customer(1)).to eq([@cus1])
        expect(@fine.find_customer(2)).to eq([@cus2])
        expect(@bark.find_customer(3)).to eq([@cus3])
        expect(@bark.find_customer(4)).to eq([@cus4])
        
        expect(@bark.find_customer(4)).to_not eq([@cus3])
      end
    end
    
    describe '#all_pets' do
      it 'returns a list of all pets assigned to a DayCare' do
        expect(@fine.all_pets).to eq([@pet11, @pet12, @pet21, @pet22])
        
        expect(@bark.all_pets).to eq([@pet31, @pet32, @pet41])
      end
    end
    
    describe '#hungry_pets' do
      it 'returns a list of animals that have not been fed' do
        expect(@fine.hungry_pets).to eq([@pet11, @pet12, @pet21, @pet22])
        
        @pet11.feed
        @pet21.feed
        
        expect(@fine.hungry_pets).to eq([@pet12, @pet22])
      end
    end
  end
end