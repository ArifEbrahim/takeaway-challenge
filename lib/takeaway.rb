require './lib/menu.rb'

class Takeaway 

  attr_reader :basket

  def initialize(menu=Menu.new)
    @menu = menu
    @dishes = @menu.generate
    @basket = Hash.new(0)
  end


  def view_menu
    @dishes
  end

  def order(item, quantity=1)
    @basket[item] += quantity
  end
end