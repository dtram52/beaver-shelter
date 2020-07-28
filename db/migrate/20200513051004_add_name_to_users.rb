class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.boolean :email_notifications, default: false
    end
  end
end
