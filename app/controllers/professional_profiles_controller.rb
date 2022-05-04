class ProfessionalProfilesController < ApplicationController
    before_action :set_professional_profile, only: [:show, :edit, :update, :destroy]
    
    # def new
    #     @professional_profile = ProfessionalProfille.find(params[:id])
    # end

    def edit
    end

    def update
        if current_user.professional_profile.update(professional_profile_params)
            redirect_to user_professional_profile_path(current_user.professional_profile), notice: "Your profile was successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @agenda = current_user.professional_profile.agendas.new
    end

    def destroy
        @professional_profile.barber_shop_images.find(params[:id])
        @professional_profile.barber_shop_images.push
        # @professional_profile.barber_shop_images.purge
        # redirect_to user_professional_profile_path(current_user.professional_profile), notice: "Your profile was successfully deleted"
    end

    private 

    def set_professional_profile
        @professional_profile = ProfessionalProfile.find(params[:id])
    end

    def professional_profile_params
        params.require(:professional_profile).permit(:description,:business_hours,:active, :user_id,barber_shop_images: [], haircut_images: [])
    end


end
