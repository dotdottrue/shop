class ShippingMethod < ActiveRecord::Base
  belongs_to :order

  def total_vat
  	self.vat_rate * self.price / 100
  end

end
