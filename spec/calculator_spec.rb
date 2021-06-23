require './lib/calculator.rb'

RSpec.describe Calculator do
  let(:basket) { {'Pizza' => 1, 'Burger' => 2} }
  let(:test_menu) { { 'Pizza' => 5.00, 'Burger' => 6.00 } }
  subject(:menu) {described_class.new}
  
  it 'calculates the basket total' do
    expect(menu.calculate_total(basket, test_menu)).to eq(17)
  end


end