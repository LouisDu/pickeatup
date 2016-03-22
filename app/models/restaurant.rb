class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_type
  belongs_to :user
  has_many :meals, dependent: :destroy

  validates_presence_of :name,
                        :street_number,
                        :route,
                        :locality,
                        :administrative_area_level_1,
                        :postal_code,
                        :country,
                        :logo

  validates_uniqueness_of :name

  geocoded_by :address
  after_validation :geocode, if: :route_changed?

  mount_uploader :logo, PhotoUploader

  def address
    "#{street_number} #{route}, #{postal_code}, #{locality}, #{administrative_area_level_1}, #{country}"
  end
end
