class ChangeTypeToAnimalType < ActiveRecord::Migration[5.2]
  def change
    change_table :animal_profiles do |t|
      t.rename :type, :animal_type
    end
  end
end
