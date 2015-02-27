class AddOptionalAddressToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :invoice_firstname, :string
  	add_column :carts, :invoice_lastname, :string
  	add_column :carts, :invoice_zipcode, :integer
  	add_column :carts, :invoice_site, :string
  	add_column :carts, :invoice_street, :string
  	add_column :carts, :invoice_country, :string
  	add_column :carts, :invoice_company, :string
    add_column :carts, :shipping_firstname, :string
    add_column :carts, :shipping_lastname, :string
    add_column :carts, :shipping_zipcode, :integer
    add_column :carts, :shipping_site, :string
    add_column :carts, :shipping_street, :string
    add_column :carts, :shipping_country, :string
    add_column :carts, :shipping_company, :string
  	add_column :carts, :optional_invoice_address, :boolean, :default => true
  end
end