class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_type
  belongs_to :user
  has_many :meals, dependent: :destroy

  validates_presence_of :name,
                        :street_number,
                        :route,
                        :locality,
                        :adminitrative_area_level_1,
                        :postal_code,
                        :country,
                        :logo,
  validates_uniqueness_of :name
end
