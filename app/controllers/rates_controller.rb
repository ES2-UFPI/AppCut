class RatesController < ApplicationController
    before_action :authenticate_user!, only: %i[edit new create]
    before_action :set_rate, only: %i[show edit destroy update]
    def new
        @rate = rate.new
    end
    
    def edit
    end

    def create
    
        @rate = Rate.new(rate_params.merge({user_id: current_user.id, professional_profile_id: params[:professional_profile_id]}))
        byebug
        respond_to do |format|
            if @rate.save
                byebug
                format.html { redirect_to user_professional_profile_path(params[:user_id], params[:professional_profile_id]), notice: "rate was successfully created." }
            else
                format.html { redirect_to user_professional_profile_path(params[:user_id], params[:professional_profile_id]), notice: "not  was successfully created." }
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
