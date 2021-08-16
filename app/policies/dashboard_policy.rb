class DashboardPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def my_account?
    true
  end
end
