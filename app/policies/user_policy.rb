class UserPolicy < ApplicationPolicy

  def show?
      user == record
  end

end
