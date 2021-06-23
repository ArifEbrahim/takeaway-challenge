RSpec.describe 'Feature tests' do
  let(:dishes) { { 'Salad' => 1.00, 'Soup' => 2.00, 'Pasta' => 5.00, 'Pizza' => 7.00 } }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'allows users to view the menu' do
    t = Takeaway.new
    expect(t.view_menu).to eq(dishes)
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows users to order items' do
    t = Takeaway.new
    t.order('Soup')
    t.order('Pasta', 2)
    expect(t.basket).not_to be_empty
    expect(t.basket).to include('Soup')
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'allows users to check their basket total' do
    t = Takeaway.new
    t.order('Soup')
    t.order('Pasta', 2)
    expect(t.total).to eq ('Total £12.00')
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


end
