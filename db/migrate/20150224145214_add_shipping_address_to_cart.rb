class AddShippingAddressToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :shipping_firstname, :string
  	add_column :carts, :shipping_lastname, :string
  	add_column :carts, :shipping_street, :string
  	add_column :carts, :shipping_zipcode, :integer
  	add_column :carts, :shipping_site, :string
  	add_column :carts, :shipping_country, :string
  end
end
