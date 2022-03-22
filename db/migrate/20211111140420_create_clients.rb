class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.integer :client_number
      t.string :client_name
      t.string :postal_code
      t.string :address
      t.string :manager
      t.string :phone_number

      t.timestamps
    end
  end
end
