require 'pry'
class CashRegister
  attr_accessor :total, :discount, :price, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @price = []
  end

  def add_item(item, price, quantity = 1)
    @price << price * quantity
    @total += price * quantity
    if quantity > 1
      counter = 0
      while counter < quantity
        @items << item
        counter += 1
      end
    else
      @items << item
    end
  end

  def apply_discount
    if @discount > 0
      @to_take_off =  @discount/100.0
      @to_take_off *= @total
      @total -= @to_take_off
      return "After the discount, the total comes to $#{total.to_f}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @price[-1]
  end
end
