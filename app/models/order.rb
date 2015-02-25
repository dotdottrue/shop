class Order < ActiveRecord::Base
  has_one :user
  has_one :cart
  belongs_to :payment
  has_many :order_line_items

  enum status: [:process, :payment, :shipping, :canceled]

  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      order_line_item = OrderLineItem.new
      order_line_item.product_name = line_item.product.name
      order_line_item.product_short_description = line_item.product.short_description
      order_line_item.product_description = line_item.product.description
      order_line_item.product_price = line_item.product.price
      order_line_item.product_vat_rate = line_item.product.vat_rate
      order_line_item.product_quantity = line_item.quantity
      order_line_items << order_line_item
    end
  end

end