class Review < ActiveRecord::Base
  belongs_to :product
  validates_inclusion_of :grade, :in => 1..6
end
