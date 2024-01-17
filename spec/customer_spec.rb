require 'pry'
require './lib/customer'

RSpec.describe Customer do
  before :each do
    @joel = Customer.new("Joel", 2)
    # @joel = Customer.new({name: "Joel", id: 2})
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
  end
end

