class AdminPolicy < ApplicationPolicy
  def create?
    user.role.admin?
  end

  def new?
    create?
  end

  def update?
    user.role.admin?
  end

  def edit?
    update?
  end
end
