class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :shipping_method
  belongs_to :payment

  accepts_nested_attributes_for :line_items

  def add_product(product_id)
    new_product = line_items.find_by_product_id(product_id)
    if new_product
      if new_product.quantity.nil?
        new_product.quantity = 1
      else
        new_product.quantity += 1
      end
    else
      new_product = line_items.build(:product_id => product_id)
    end

    new_product
  end

  def total_price
    line_items.to_a.sum{ |item| item.total_price }
  end

  def total_vat
    line_items.to_a.sum{ |item| item.total_vat }
  end

end
