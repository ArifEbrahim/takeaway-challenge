require './lib/takeaway'

RSpec.describe Takeaway do
  let(:test_menu) { { 'Pizza' => 5.00, 'Burger' => 6.00 } }
  let(:menu) { double :menu, generate: test_menu }
  let(:calculator) {double :calculator}
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
      expect(takeaway.basket).not_to be_empty
      expect(takeaway.basket).to include('Pizza')
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
end
