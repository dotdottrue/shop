class AddShippingMethodIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :shipping_method_id, :integer , :default => 1
  	add_column :carts, :payment_id, :integer , :default => 1
  end
end
