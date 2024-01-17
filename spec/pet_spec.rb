require 'pry'
require './lib/pet'

RSpec.describe Pet do
  before :each do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@samson).to be_a(Pet)
    end
    
    it 'has attributes' do
      expect(@samson.name).to eq("Samson")
      expect(@samson.type).to eq(:dog)
      expect(@samson.age).to eq(3)
    end
    
    it 'has fed set to false as a default' do
      expect(@samson.fed?).to eq(false)
    end
  end
  
  describe '#fed? and #feed' do
    it 'returns fed status' do
      expect(@samson.fed?).to eq(false)
    end
    
    it 'can change #fed? status' do
      @samson.feed
      expect(@samson.fed?).to eq(true)
    end
  end
end