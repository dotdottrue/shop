class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      tmp_quantity = current_item.quantity
      if tmp_quantity.nil?
        tmp_quantity = 1
      else
        tmp_quantity += 1
      end
      current_item.quantity = tmp_quantity


    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum{ |item| item.total_price}
  end
end
