class Order < ActiveRecord::Base
  has_one :user
  has_one :cart

  enum status: [:process, :payment, :shipping, :canceled]

end