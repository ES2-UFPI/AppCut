class AgendasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agenda, only: %i[show edit destroy update]

  def index
    if current_user.id ==  ProfessionalProfile.find(params[:professional_profile_id]).user.id
      @agendas = ProfessionalProfile.find(params[:professional_profile_id]).agendas.order(
        start_time: :desc
      )
    else
      @agendas = []
    end
  end

  def show
    authorize @agenda
  end

  def create
    @agenda = current_user.professional_profile.agendas.new(agenda_params)
    respond_to do |format|
      if @agenda.save
        format.html { redirect_to user_professional_profile_agenda_path(current_user.id, current_user.professional_profile.id, @agenda.id), notice: "Agenda was successfully created." }
        format.json { render :show, status: :created, location: @agenda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @agenda

    @agenda.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Agenda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update
    authorize @agenda

    respond_to do |format|
      if @agenda.update(agenda_params)
        format.html { redirect_to user_professional_profile_agenda_path(current_user.id, current_user.professional_profile.id, @agenda.id), notice: "Agenda was successfully updated." }
        format.json { render :show, status: :created, location: @agenda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @agenda = Agenda.new
  end

  def edit
    authorize @agenda
  end

  private
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    def agenda_params
      params.require(:agenda).permit(:id, :start_time, :professional_profile_id)
    end
end