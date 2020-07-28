class AddAddressToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :street_address, :string
    add_column :shelters, :zip_code, :string
    add_column :shelters, :city, :string
    add_column :shelters, :state, :string
  end
end
