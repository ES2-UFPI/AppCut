class HomeController < ApplicationController
  def index
    @barber_shops = ProfessionalProfile.active.order(
      created_at: :asc
    ).page(params[:page]).per(8)
  end
end
