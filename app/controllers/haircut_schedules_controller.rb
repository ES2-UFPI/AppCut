class HaircutSchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_haircut_schedule, only: %i[show edit update destroy]

  def show
    authorize @haircut_schedule
  end

  def new
    authorize HaircutSchedule

    @haircut_schedule = current_user.haircut_schedules.new(agenda_id: params[:agenda_id])
  end

  def create
    authorize HaircutSchedule

    @haircut_schedule = current_user.haircut_schedules.new(haircut_schedule_params.merge({ agenda_id: params[:agenda_id] }))

    if @haircut_schedule.save
      redirect_to professional_profile_agenda_haircut_schedule_path(params[:professional_profile_id], params[:agenda_id], @haircut_schedule.id), notice: "HaircutSchedule created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @haircut_schedule
  end

  def update
    authorize @haircut_schedule

    if @haircut_schedule.update(haircut_schedule_params)
      redirect_to root_path, notice: "HaircutSchedule updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @haircut_schedule.destroy
    redirect_to root_path, notice: "Agendamento cancelado com sucesso!"
  end

  private

  def set_haircut_schedule
    @haircut_schedule = HaircutSchedule.find(params[:id])
  end

  def haircut_schedule_params
    params.require(:haircut_schedule).permit(:id, :reservation_date, :user_id, :agenda_id)
  end
end
