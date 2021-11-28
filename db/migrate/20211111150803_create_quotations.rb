class CreateQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :quotations do |t|
      t.string :store
      t.date :worked_date
      t.string :staff_name
      t.time :work_start_time, default: Time.current.change(hour: 9, min: 00, sec: 0)
      t.time :work_end_time, default: Time.current.change(hour: 18, min: 00, sec: 0)
      t.time :break_time, default: Time.current.change(hour: 1, min: 0, sec: 0)
      t.string :division
      t.integer :unit_price
      t.integer :gain_cards
      t.integer :gain_apps
      t.integer :incentive
      t.integer :commuting_allowance
      t.string :note

      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
