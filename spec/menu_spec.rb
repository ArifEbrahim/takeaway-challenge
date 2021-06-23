require './lib/menu.rb'

RSpec.describe Menu do
  describe '#generate' do
    let (:dishes) { {"Salad"=>1.00, "Soup"=>2.00, "Pasta"=>5.00, "Pizza"=>7.00} }
    it 'creates a list of dishes and their prices' do
      expect(subject.generate).to eq(dishes)
    end
  end
end