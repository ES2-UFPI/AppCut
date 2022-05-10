class RatesController < ApplicationController
    before_action :authenticate_user!, only: %i[edit new create]
    before_action :set_rate, only: %i[show edit destroy update]
    def new
        @rate = rate.new
    end
    
    def edit
    end

    def create
    
        @rate = current_user.professional_profile.rates.new(rate_params.merge({ professional_profile_id: params[:professional_profile_id],user_id: current_user.id }))
        respond_to do |format|
            if @rate.save
                format.html { redirect_to user_professional_profile_path(current_user.id, current_user.professional_profile.id, @rate.id), notice: "rate was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
    
    private
    def set_rate
      @rate = rate.find(params[:id])
    end

    def rate_params
      params.require(:rate).permit(:id, :rate,:comment, :professional_profile_id,:user_id)
    end
end
