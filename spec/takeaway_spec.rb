require './lib/takeaway.rb'

RSpec.describe Takeaway do
  let (:test_menu) { {"Pizza" => 5, "Burger" => 6} }
  # let (:menu) { double: menu, generate: test_menu}
  
  describe '#view_menu' do
    it 'displays a list of dishes and their prices' do
      expect(subject.view_menu).to eq(test_menu)
    end  
  end
   
end
