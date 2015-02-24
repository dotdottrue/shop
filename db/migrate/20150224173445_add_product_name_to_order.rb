class AddProductNameToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :product_name, :string 
  	add_column :orders, :quantity, :integer
  	add_column :orders, :product_price, :decimal
  end
end
