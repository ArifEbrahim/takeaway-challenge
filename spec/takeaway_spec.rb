# frozen_string_literal: true

require './lib/takeaway'

RSpec.describe Takeaway do
  let(:test_menu) { { 'Pizza' => 5.00, 'Burger' => 6.00 } }
  let(:menu) { double :menu, generate: test_menu }
  subject { described_class.new(menu) }

  describe '#view_menu' do
    it 'displays a list of dishes and their prices' do
      expect(subject.view_menu).to eq(test_menu)
    end
  end

  describe '#order' do
    it 'allows users to order dishes from the menu' do
      subject.order('Pizza')
      subject.order('Burger', 2)
      expect(subject.basket).not_to be_empty
      expect(subject.basket).to include('Pizza')
    end
  end

  describe '#total' do
    it 'allows users to check their basket total' do
      t = Takeaway.new
      subject.order('Pizza')
      subject.order('Burger', 2)
      expect(subject.total).to eq ('Total £17.00')
    end
  end
end
