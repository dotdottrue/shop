class Product < ActiveRecord::Base
  #default_scope :order => 'name'
  has_many :line_items
  has_many :categories, through: :product_categories
  has_many :product_categories

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :description, :price, presence: true

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
