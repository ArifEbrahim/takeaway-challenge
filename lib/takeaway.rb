require './lib/menu.rb'
require './lib/calculator.rb'
require './lib/message.rb'

class Takeaway
  attr_reader :basket

  def initialize(menu = Menu.new, calculator = Calculator.new, message = Message.new)
    @dishes = menu.generate
    @basket = Hash.new(0)
    @calculator = calculator
    @message = message
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
    "Total £#{'%.2f' % total}"
  end

  def summary
    @basket
  end

  def purchase
    @message.send_sms
  end

  private

  def item_present?(item)
    @dishes.key?(item)
  end

end
