require 'pry'
require './lib/pet'
require './lib/customer'
require './lib/groomer'

RSpec.describe Groomer do
  before :each do
    @bark = Groomer.new({name: "Bark n Snip"})
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@bark).to be_a(Groomer)
    end
    
    it 'has attributes' do
      expect(@bark.name).to eq("Bark n Snip")
      expect(@bark.customers).to eq([])
    end
  end
  
end