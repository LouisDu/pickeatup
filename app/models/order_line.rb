class OrderLine < ActiveRecord::Base
  belongs_to :meal
  belongs_to :order

  validates :meal_price, numericality: { greater_than: 0 }
  validates :meal_quantity, numericality: { greater_than: 0 }
  validates_uniqueness_of :meal_id, :scope => [:order_id]
end
