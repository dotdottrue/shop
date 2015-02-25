class ShippingMethod < ActiveRecord::Base
  has_many :carts
  has_many :order

  def total_vat
  	self.vat_rate * self.price / 100
  end

end
