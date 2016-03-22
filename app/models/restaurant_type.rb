class RestaurantType < ActiveRecord::Base
  has_many :restaurants

  include PgSearch
  multisearchable :against => [:name]
end
