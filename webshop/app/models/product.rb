class Product < ActiveRecord::Base
  has_many :categories, through: :product_categories
  has_many :product_categories

  validates :name, :description, :price, presence: true
end
