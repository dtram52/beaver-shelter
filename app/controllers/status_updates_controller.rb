class StatusUpdatesController < InheritedResources::Base
  before_action :authenticate_shelter!, only: [:edit, :new, :create]

  def new
    @status_update = StatusUpdate.new
    @animal_profiles = AnimalProfile.where(shelter_id: current_shelter.id)
    if @animal_profiles.length == 0
      flash[:alert] = "Your shelter must have at least one animal before making a status update"
      redirect_to status_updates_path
    end
  end

  def edit
    @status_update = StatusUpdate.find(params[:id])
    if @status_update.shelter_id != current_shelter.id
      flash[:alert] = "Your shelter cannot edit another shelter's status update"
      redirect_to status_updates_path
    end
    @animal_profiles = AnimalProfile.where(id: current_shelter.id)
  end

  def create
    @status_update = StatusUpdate.new(status_update_params)
    @status_update.shelter_id = current_shelter.id
    if @status_update.save
      redirect_to status_updates_path
    else
      @animal_profiles = AnimalProfile.where(id: current_shelter.id)
      render :new
    end
  end

  private

    def status_update_params
      params.require(:status_update).permit(:shelter_id, :animal_profile_id, :content, images: [])
    end

end
