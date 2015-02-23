class CreateShippingMethods < ActiveRecord::Migration
  def change
    create_table :shipping_methods do |t|
      t.string :name
      t.string :duration
      t.decimal :price
      t.decimal :vat_rate

      t.timestamps null: false
    end
  end
end
