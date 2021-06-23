class Calculator
  def calculate_total(basket, menu)
    total = 0
    basket.each do |item, quantity|
      total += (menu[item] * quantity)
    end
    return total
  end
end