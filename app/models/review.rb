class Review < ActiveRecord::Base
  belongs_to :product
  validates :decription, presence: true
end
