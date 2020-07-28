json.extract! animal_profile, :id, :name, :animal_type, :breed, :weight, :height, :color, :good_with_animals, :good_with_children, :must_be_leashed, :availability, :image_url, :created_at, :updated_at
json.url animal_profile_url(animal_profile, format: :json)
