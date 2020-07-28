class AnimalProfilesController < InheritedResources::Base
  before_action :authenticate_shelter!, only: [:edit, :create]

  def index
    @search = AnimalProfile.where.not(availability: "Adopted").search(params[:q])
    @animal_profiles = @search.result.page(params[:page])
  end

  def edit
    @animal_profile = AnimalProfile.find(params[:id])
  end

  def create
    @animal_profile = AnimalProfile.new(animal_profile_params)
    @animal_profile.shelter_id = current_shelter.id
    if @animal_profile.save
      redirect_to animal_profiles_path
    else
      render :new
    end
  end

  private

    def animal_profile_params
      params.require(:animal_profile).permit(:name, :animal_type, :breed, :weight, :height, :color, :good_with_animals, :good_with_children, :must_be_leashed, :availability, :image_url, images: [])
    end

end
