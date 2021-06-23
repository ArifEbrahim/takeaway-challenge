require './lib/takeaway'

RSpec.describe Takeaway do
  let(:test_menu) { { 'Pizza' => 5.00, 'Burger' => 6.00 } }
  let(:menu) { double :menu, generate: test_menu }
  let(:calculator) { double :calculator }
  let(:message) { double :message  }
  let(:test_order) { {'Pizza' => 1, 'Burger' => 2} }
  subject(:takeaway) { described_class.new(menu, calculator) }

  describe '#view_menu' do
    it 'displays a list of dishes and their prices' do
      expect(takeaway.view_menu).to eq(test_menu)
    end
  end

  describe '#order' do
    it 'allows users to order dishes from the menu' do
      takeaway.order('Pizza')
      takeaway.order('Burger', 2)
      expect(takeaway.basket).to eq(test_order)
    end

    it 'throws an error if the item is not on the menu' do
      expect{ takeaway.order('Calzone')}.to raise_error('Item not on menu, please try again') 
    end
  end

  describe '#total' do
    it 'allows users to check their basket total' do
      takeaway.order('Pizza')
      takeaway.order('Burger', 2)
      allow(calculator).to receive(:calculate_total).and_return(17)
      expect(takeaway.total).to eq ('Total £17.00')
    end
  end

  describe '#summary' do
    it 'shows the user a summary of their order' do
      takeaway.order('Pizza')
      takeaway.order('Burger', 2)
      expect(takeaway.summary).to eq(test_order)
    end
  end

  # describe '#purchase' do
  #   it 'sends the user a text message confirming the order & delivery time' do
      
  #   end
  # end
end
