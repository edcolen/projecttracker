class SectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.project.members.include?(user)
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    privilege_check
  end

  def update?
    privilege_check
  end

  def destroy?
    privilege_check
  end

  def privilege_check
    privilege = Privilege.where(admin_id: user.id, project_id: record.project.id)
    privilege.empty? ? false : true
  end
end
