class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.members.include?(user)
  end

  def new?
    user
  end

  def create?
    user
  end
end
