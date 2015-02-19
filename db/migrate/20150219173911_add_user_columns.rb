class AddUserColumns < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :street, :string
    add_column :users, :zipcode, :string
    add_column :users, :telephone, :string
    add_column :users, :birth, :date
    add_column :users, :company, :string
  end
end
