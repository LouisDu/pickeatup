class Review < ActiveRecord::Base
  belongs_to :meal
  belongs_to :user

  validates :rating, inclusion: { in: (0..5).to_a }, numericality: true
end
