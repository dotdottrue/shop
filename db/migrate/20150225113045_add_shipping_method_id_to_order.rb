class AddShippingMethodIdToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :shipping_method_id, :integer
  	add_column :orders, :payment_id, :integer
  end
end
