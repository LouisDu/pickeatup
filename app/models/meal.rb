class Meal < ActiveRecord::Base
  belongs_to :meal_type
  belongs_to :restaurant
  has_many :reviews, dependent: :destroy
  has_many :order_lines, dependent: :destroy

  validates_presence_of :name,
                        :price,
                        :picture,
                        :prep_time,
                        :description

  validates :price, numericality: { greater_than: 0 }
  validates :prep_time, numericality: { greater_than: 0 }

  mount_uploader :picture, PhotoUploader

  include PgSearch
  multisearchable against: [:name]

  def average_rating
    if self.reviews.size > 0
        self.reviews.average(:rating)
    else
      -1
    end
  end


end
