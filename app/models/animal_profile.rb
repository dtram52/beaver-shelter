class AnimalProfile < ApplicationRecord
  belongs_to :shelter
  has_many :status_updates
  has_many_attached :images

  ANIMAL_TYPES = [
    "dog",
    "cat",
    "bird",
    "rabbit",
    "goat",
    "llama",
    "horse",
    "other"
  ]

  STATUS_OPTIONS = [
    "Not Available",
    "Available",
    "Pending",
    "Adopted"
  ]
end
