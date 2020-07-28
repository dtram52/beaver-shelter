ActiveAdmin.register AnimalProfile do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :animal_type, :breed, :weight, :height, :color, :good_with_animals, :good_with_children, :must_be_leashed, :availability, :image_url, :shelter_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :animal_type, :breed, :weight, :height, :color, :good_with_animals, :good_with_children, :must_be_leashed, :availability, :image_url, :shelter_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
