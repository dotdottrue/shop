class ShippingMethod < ActiveRecord::Base
  has_many :carts

  def total_vat
  	self.vat_rate * self.price / 100
  end

end
