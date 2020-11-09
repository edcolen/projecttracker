class SectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.project.members.include?(user)
  end

  def edit?
    privilege_check || section_leadership_check
  end

  def update?
    privilege_check || section_leadership_check
  end

  def destroy?
    privilege_check || section_leadership_check
  end

  def privilege_check
    privilege = Privilege.where(admin_id: user.id, project_id: record.project.id)
    privilege.empty? ? false : true
  end

  def section_membership_check
    section_membership = SectionTeaming.where(member_id: user.id, section_id: record.id)
    section_membership.empty? ? false : true
  end

  def section_leadership_check
    record.leader.id == user.id
  end
end
