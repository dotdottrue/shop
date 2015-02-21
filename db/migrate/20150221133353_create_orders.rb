class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :user_id
      t.decimal :total_price, precision: 8, scale: 2 
      t.datetime :order_date

      t.timestamps null: false
    end
  end
end
