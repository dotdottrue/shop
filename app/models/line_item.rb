class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
      tmp_quantity = quantity
      if tmp_quantity.nil?
        tmp_quantity = 1
      end
      product.price * tmp_quantity

          #quantity
  end
end
