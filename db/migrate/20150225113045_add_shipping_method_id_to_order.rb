class AddShippingMethodIdToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :shipping_method_id, :integer
  	add_column :orders, :payment_id, :integer
  	add_column :orders, :shipping_method_name, :string
  	add_column :orders, :shipping_method_price, :decimal
  	add_column :orders, :line_items, :integer
  end
end