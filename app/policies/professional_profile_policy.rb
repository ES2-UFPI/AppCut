class ProfessionalProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.client? || user.barber_shop?
        ProfessionalProfile.joins(:user).where(users: { profile: barber_shop})
      else
        ProfessionalProfile.joins(:user).where(users: { profile: barber_shop})
      end
    end
  end

  def index?
    user.client?
  end

  def show?
    user.id == record.user_id
  end

  def create?
  end

  def edit?
    user.id == record.user_id
  end

  def update?
    :edit?
  end

  def destroy?
    user.id == record.user_id
  end
end