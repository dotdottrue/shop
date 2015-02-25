class Payment < ActiveRecord::Base
  has_many :cart
  has_many :order
end
