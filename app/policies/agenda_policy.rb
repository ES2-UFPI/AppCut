class AgendaPolicy < ApplicationPolicy
  def show?
    user.id == record.professional_profile.user.id
  end

  def edit?
    user.id == record.professional_profile.user.id
  end

  def update?
    :edit?
  end

  def destroy?
    user.id == record.professional_profile.user.id
  end
end