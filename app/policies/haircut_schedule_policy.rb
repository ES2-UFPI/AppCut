class HaircutSchedulePolicy < ApplicationPolicy
  def show?
    user.id == record.user_id || user.id == record.agenda.professional_profile.user.id
  end

  def create?
    user.client?
  end

  def edit?
    user.id == record.user_id || user.id == record.agenda.professional_profile.user.id
  end

  def update?
    :edit?
  end

  def destroy?
    user.id == record.user_id || user.id == record.agenda.professional_profile.user.id
  end
end