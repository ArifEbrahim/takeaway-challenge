# frozen_string_literal: true

require './lib/menu'

class Takeaway
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = @menu.generate
    @basket = Hash.new(0)
  end

  def view_menu
    @dishes
  end

  def order(item, quantity = 1)
    @basket[item] += quantity
  end

  def total
    total = 0
    @basket.each do |item, quantity|
      total += (@dishes[item] * quantity)
    end
    return "Total £#{'%.2f' % total}"
  end
end
