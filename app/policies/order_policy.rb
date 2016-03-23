class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.orders.reverse
    end
  end

  def show?
    @record.user == @user
  end

  def create?
    true
  end

  def update?
    true
  end
end
