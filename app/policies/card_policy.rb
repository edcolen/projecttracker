class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.section.project.members.include?(user)
  end

  def edit?
    privilege_check || section_leadership_check || card_leadership_check
  end

  def update?
    privilege_check || section_leadership_check || card_leadership_check
  end

  # def destroy?
  #   privilege_check
  # end

  def privilege_check
    privilege = Privilege.where(admin_id: user.id, project_id: record.section.project.id)
    privilege.empty? ? false : true
  end

  def section_membership_check
    section_membership = SectionTeaming.where(member_id: user.id, section_id: record.section.id)
    section_membership.empty? ? false : true
  end

  def section_leadership_check
    record.section.leader.id == user.id
  end

  def card_membership_check
    card_membership = CardTeaming.where(member_id: user.id, card_id: record.id)
    card_membership.empty? ? false : true
  end

  def card_leadership_check
    record.leader.id == user.id
  end
end
