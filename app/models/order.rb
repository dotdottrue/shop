class Order < ActiveRecord::Base
  has_one :user
  has_one :cart
  has_many :shipping_method

  enum status: [:process, :payment, :shipping, :canceled]

end