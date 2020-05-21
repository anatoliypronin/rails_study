class CoursePolicy < ApplicationPolicy
  def update?
    user.role.admin?
  end

  def edit?
    update?
  end
end
