class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_lines, dependent: :destroy

  def set_pick_up_time
    prep_times = []
    self.order_lines.each do |order_line|
      prep_times << order_line.meal.prep_time
    end

    max_prep_time = prep_times.sort.last

    @pick_up_time = Time.now + max_prep_time * 60
  end


  def set_bill
    subtotal = 0
    self.order_lines.each do |order_line|
      subtotal += order_line.meal_price * order_line.meal_quantity
    end
    @bill = subtotal
  end

end
