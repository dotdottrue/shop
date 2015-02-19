class Product < ActiveRecord::Base
<<<<<<< HEAD
  #default_scope :order => 'name'
  has_many :line_items
  has_many :categories, through: :product_categories
  has_many :product_categories

  validates :name, :description, :price, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300", :small => "200x200" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items still present')
      return false
    end
  end
end
