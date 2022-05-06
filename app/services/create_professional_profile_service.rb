class CreateProfessionalProfileService
    def initialize(resource)
      @resource = resource
    end

    def call
        if @resource.barber_shop?
            @resource.professional_profile = ProfessionalProfile.create(active: true) 
        else
            @resource.professional_profile = ProfessionalProfile.create(active: false)
        end
    end
end