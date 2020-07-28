json.extract! status_update, :id, :shelter_id, :animal_profile_id, :content, :created_at, :updated_at
json.url status_update_url(status_update, format: :json)
