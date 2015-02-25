class Order < ActiveRecord::Base
  has_one :user
  has_one :cart
  has_many :line_items, :dependent => :destroy
  belongs_to :shipping_method
  belongs_to :payment

  enum status: [:process, :payment, :shipping, :canceled]

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end