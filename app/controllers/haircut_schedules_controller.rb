class HaircutSchedulesController < ApplicationController
  before_action :set_haircut_schedule, only: %i[show edit update]

  def show
  end

  def new
    @haircut_schedule = current_user.haircut_schedules.new(agenda_id: params[:agenda_id])
  end

  def create
    @haircut_schedule = current_user.haircut_schedules.new(haircut_schedule_params.merge({ agenda_id: params[:agenda_id] }))

    if @haircut_schedule.save
      redirect_to root_path, notice: "HaircutSchedule created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @haircut_schedule.update(haircut_schedule_params)
      redirect_to root_path, notice: "HaircutSchedule updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_haircut_schedule
    @haircut_schedule = HaircutSchedule.find(params[:id])
  end

  def haircut_schedule_params
    params.require(:haircut_schedule).permit(:id, :reservation_date, :user_id, :agenda_id)
  end
end
