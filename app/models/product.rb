require 'open-uri'

class Product < ActiveRecord::Base
  has_many :line_items
  has_many :categories, through: :product_categories
  has_many :product_categories

  validates :name, :description, :short_description, :price, :vat_rate, :avatar, presence: true

  has_attached_file :avatar, :styles => { :medium => '300x300', :small => '200x200', :mini => '100x100' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def picture_from_url(url)
    self.avatar = URI.parse(url)
  end

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
