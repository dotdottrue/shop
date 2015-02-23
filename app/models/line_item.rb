class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
      product.price * quantity
  end

  def total_vat
      product.vat * quantity
  end
end
