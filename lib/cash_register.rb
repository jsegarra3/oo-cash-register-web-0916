class CashRegister

  attr_accessor :total, :discount

  def initialize(discount=100)
    @total = 0
    @discount = discount
    @last_price = 0
    @item_list = []
  end

  def add_item(title,price,quantity=1)
    add_total_item_list(title,quantity)
    @last_price = price*quantity
    @total += @last_price
  end

  def add_total_item_list(title, quantity=1)
    for i in 1..quantity
      @item_list << title
    end
  end

  def apply_discount
    if @discount==100
      return "There is no discount to apply."
    else
      @total = @total - (@total * @discount/100)
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @item_list
  end

  def void_last_transaction
    @item_list.pop
    @total -= @last_price
  end

end
