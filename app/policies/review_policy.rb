class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
     scope.all
    end
  end

  def create?
    return false if @record.user == @record.meal.restaurant.user
    meal_array = []
    @user.orders.each do |order|
      order.order_lines.each do |order_line|
        meal_array << order_line.meal
      end
    end
    meal_array.include? (@record.meal)
  end
end
