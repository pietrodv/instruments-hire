class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user_is_owner?
  end

  def create?
    true
  end

  private

  def user_is_owner?
    # 1. user - the user that is logged in
    # 2. record - the record you a tryin to access/change - in this case Restaurant instance
    record.user == user
  end
end
