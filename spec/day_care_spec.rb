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
    @bark    = DayCare.new({name: "Barking Bad"})
  end
  
  describe 'initialize' do
    it 'exists' do
      expect(@fine).to be_a(DayCare)
      expect(@bark).to be_a(DayCare)
    end
    
    it 'has attributes' do
      expect(@fine.name).to eq("Fine Whine and Lickers")
      expect(@fine.customers).to eq([])
      expect(@bark.name).to eq("Barking Bad")
      expect(@bark.customers).to eq([])
    end
  end
end