require './lib/menu'
require './lib/calculator'

class Takeaway
  attr_reader :basket

  def initialize(menu = Menu.new, calculator = Calculator.new)
    @dishes = menu.generate
    @basket = Hash.new(0)
    @calculator = calculator
  end

  def view_menu
    @dishes
  end

  def order(item, quantity = 1)
    raise 'Item not on menu, please try again' unless item_present?(item)
    @basket[item] += quantity
    "#{quantity} #{item}(s) added to your basket"
  end

  def total
    total = @calculator.calculate_total(@basket, @dishes)
    return "Total £#{'%.2f' % total}"
  end

  private

  def item_present?(item)
    @dishes.key?(item)
  end
end
