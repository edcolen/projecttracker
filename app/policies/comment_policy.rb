class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    owner? && record.created_at >= Time.now - 10.minutes
  end

  def update?
    owner? && record.created_at >= Time.now - 10.minutes
  end

  private

  def owner?
    user == record.user
  end
end
