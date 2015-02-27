class CreateShippingMethods < ActiveRecord::Migration
  def change
    create_table :shipping_methods do |t|
      t.string :name
      t.string :duration
      t.decimal :price, precision: 8, scale: 2
      t.decimal :vat_rate, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
