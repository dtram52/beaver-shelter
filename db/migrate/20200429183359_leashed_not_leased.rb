class LeashedNotLeased < ActiveRecord::Migration[5.2]
  def change
    change_table :animal_profiles do |t|
      t.rename :must_be_leased, :must_be_leashed
    end
  end
end
