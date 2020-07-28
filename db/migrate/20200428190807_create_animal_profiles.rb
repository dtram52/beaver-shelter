class CreateAnimalProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_profiles do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.float :weight
      t.float :height
      t.string :color
      t.boolean :good_with_animals
      t.boolean :good_with_children
      t.boolean :must_be_leased
      t.string :availability
      t.string :image_url
      t.integer :shelter_id

      t.timestamps
    end
  end
end
