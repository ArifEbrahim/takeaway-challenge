require './lib/takeaway.rb'

RSpec.describe Takeaway do
  let (:test_menu) { {"Pizza" => 5, "Burger" => 6} }
  let (:menu) { double :menu, generate: test_menu}
  subject {described_class.new(menu)}
  
  describe '#view_menu' do
    it 'displays a list of dishes and their prices' do
      expect(subject.view_menu).to eq(test_menu)
    end  
  end

  describe '#order' do
    it 'allows users to order dishes from the menu' do
      subject.order("Pizza")
      subject.order("Burger", 2)
      expect(subject.basket).not_to be_empty
      expect(subject.basket).to include("Pizza") 
    end
  end
   
end
