class InstrumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # # 1. user - the user that is logged in
      # if we want to show only user's restaurants
      # scope.where(user_id: user.id)
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def search?
    true
  end

  private

  def user_is_owner?
    # 1. user - the user that is logged in
    # 2. record - the record you a tryin to access/change - in this case Restaurant instance
    record.user == user
  end
end
