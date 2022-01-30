class CreateSaninQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :sanin_quotations do |t|
      t.integer :item_number
      t.string :store
      t.date :worked_date
      t.string :staff_name
      t.time :work_start_time
      t.time :work_end_time
      t.time :break_time
      t.string :division
      t.integer :unit_price
      t.integer :commuting_allowance
      t.string :note

      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
