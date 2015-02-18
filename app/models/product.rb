class Product < ActiveRecord::Base
  has_many :categories, through: :product_categories
  has_many :product_categories

  validates :name, :description, :price, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300", :small => "200x200" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
