require './lib/menu.rb'

class Takeaway 
  def initialize(menu=Menu.new)
    @menu = menu
    @dishes = menu.generate
  end


  def view_menu
    @dishes
  end
end