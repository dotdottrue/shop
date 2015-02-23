class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id, quantity)
    new_product = line_items.find_by_product_id(product_id)
    if new_product
      if new_product.quantity.nil?
        new_product.quantity = quantity
      else
        new_product.quantity += quantity
      end
    else
      new_product = line_items.build(:product_id => product_id)
    end

    new_product
  end

  def total_price
    line_items.to_a.sum{ |item| item.total_price }
  end
end
