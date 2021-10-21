class AddDeviseCreateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :nearest_station, :string
  end
end
