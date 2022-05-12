class HomeController < ApplicationController
  def index
    @barber_shops = ProfessionalProfile.active.order(
      created_at: :asc
    ).page(params[:page]).per(8)

    @haircut_schedules = []

    @haircut_schedules = HaircutSchedule.where(user: current_user.haircut_schedules).order(
      created_at: :desc
    ).page(params[:page]).per(3) if current_user && current_user.client?
    @haircut_schedules = HaircutSchedule.where(agenda: current_user.professional_profile.agendas).order(
      created_at: :desc
    ) if current_user && current_user.barber_shop?    
  end
end
