class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.integer :order_id
      t.string :product_name
      t.text :product_short_description
      t.text :product_description
      t.decimal :product_price
      t.decimal :product_vat_rate
      t.integer :product_quantity

      t.timestamps null: false
    end
  end
end
