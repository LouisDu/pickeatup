class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_lines, dependent: :destroy

  def pick_up_time


  end

  def bill

  end

end
