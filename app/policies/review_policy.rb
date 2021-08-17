class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    owner?
  end

  private

  def owner?
    user == record.user
  end
end
