class CreateTusinQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :tusin_quotations do |t|
      t.integer :item_number
      t.string :store
      t.date :worked_date
      t.string :staff_name
      t.time :work_start_time, time: Time.current.change(hour: 9, min: 00)
      t.time :work_end_time, time: Time.current.change(hour: 18, min: 00)
      t.time :break_time, time: Time.current.change(hour: 1, min: 00)
      t.string :division
      t.integer :unit_price
      t.integer :commuting_allowance
      t.string :note

      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
