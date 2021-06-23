RSpec.describe 'Feature tests' do

  let (:dishes) { {"Salad"=>1.00, "Soup"=>2.00, "Pasta"=>5.00, "Pizza"=>7.00} }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'allows users to view the menu' do
    t = Takeaway.new
    expect(t.view_menu).to eq(dishes)
  end


end