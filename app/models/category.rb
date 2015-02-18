class Category < ActiveRecord::Base
  has_many :products, through: :product_categories
  has_many :product_categories

  def to_param
  	"#{id}-#{name.parameterize}"
  end
end
