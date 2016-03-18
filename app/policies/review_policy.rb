class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    meal_array = []
    @user.orders.each do |order|
      order.order_lines.each do |order_line|
        meal_array << order_line.meal
      end
    end
    #@user.orders.order_lines.find(@record.meal)
    raise
  end
end
