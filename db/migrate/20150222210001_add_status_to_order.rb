class AddStatusToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :status, :integer, default: 0
  	add_column :orders, :invoice_firstname, :string
  	add_column :orders, :invoice_lastname, :string
  	add_column :orders, :invoice_zipcode, :integer
  	add_column :orders, :invoice_site, :string
  	add_column :orders, :invoice_street, :string
  	add_column :orders, :invoice_country, :string
  	add_column :orders, :invoice_company, :string
    add_column :orders, :shipping_firstname, :string
    add_column :orders, :shipping_lastname, :string
    add_column :orders, :shipping_zipcode, :integer
    add_column :orders, :shipping_site, :string
    add_column :orders, :shipping_street, :string
    add_column :orders, :shipping_country, :string
    add_column :orders, :shipping_company, :string
    add_column :orders, :optional_invoice_address, :boolean
  end
end