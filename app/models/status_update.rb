class StatusUpdate < ApplicationRecord
  belongs_to :animal_profile
  belongs_to :shelter
  has_many_attached :images
end
