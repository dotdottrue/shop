class AddVatRateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :vat_rate, :double
  end
end
