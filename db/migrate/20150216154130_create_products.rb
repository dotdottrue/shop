class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
<<<<<<< HEAD:db/migrate/20150216154130_create_products.rb
      t.string :image
=======
>>>>>>> master:db/migrate/20150216154130_create_products.rb
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
