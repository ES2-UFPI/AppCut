class ProfessionalProfilesController < ApplicationController
    before_action :set_professional_profile, only: [:show, :edit, :update, :destroy]
    
    # def new
    #     @professional_profile = ProfessionalProfille.find(params[:id])
    # end

    # def index
    #     @professional_profiles = ProfessionalProfile.all
    # end

    def edit
        authorize @professional_profile
    end

    def update
        authorize @professional_profile
        if current_user.professional_profile.update(professional_profile_params)
            redirect_to user_professional_profile_path(current_user.professional_profile), notice: "Your profile was successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @agenda = current_user.professional_profile.agendas.new
        @rate = current_user.professional_profile.rates.new
        @rates = current_user.professional_profile.rates.all
    end

    def destroy
        authorize @professional_profile
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
        params.require(:professional_profile).permit(:description,:business_hours,:active, :user_id, :logo, :price, barber_shop_images: [], haircut_images: [])
    end


end
