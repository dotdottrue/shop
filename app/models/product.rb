require 'open-uri'

class Product < ActiveRecord::Base
  attr_reader :avatar_remote_url

  has_many :line_items
  has_many :categories, through: :product_categories
  has_many :product_categories

  validates :name, :description, :short_description, :price, :vat_rate, :avatar, :categories, presence: true
  validates :short_description, length: {minimum: 5, maximum: 150}, allow_blank: true

  has_attached_file :avatar, :styles => { :medium => '300x300', :small => '200x200', :mini => '100x100' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def avatar_remote_url(url_value)
    self.avatar = URI.parse(url_value)
  end

  def vat
    self.price * self.vat_rate / 100
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
