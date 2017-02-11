class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def destroy?
    return true
  end

  def show?
    return true
  end
  def complete?
    return true
  end

  def clear?
    return true
  end
end
