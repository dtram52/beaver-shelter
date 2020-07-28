class CreateStatusUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :status_updates do |t|
      t.integer :shelter_id
      t.integer :animal_profile_id
      t.text :content

      t.timestamps
    end
  end
end
