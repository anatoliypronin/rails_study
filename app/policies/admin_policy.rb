class AdminPolicy < ApplicationPolicy
  def index?
    %w[admin editor].include?(admin.role)
  end

  def show?
    user.role.admin?
  end

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

  def destroy?
    user.role.admin?
  end
end
