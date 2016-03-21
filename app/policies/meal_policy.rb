class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    @user.restaurants.find(@record.restaurant)
  end

  def update?
    @user.restaurants.find(@record.restaurant)
  end

  def destroy?
    @user.restaurants.find(@record.restaurant)
  end
end
