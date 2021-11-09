class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.date :worked_on
      t.references :user, foreign_key: true
      t.string :round_batsu # 丸ばつ
      t.string :note # 備考
      t.string :site_name #現場名
      t.timestamps
      t.boolean :color_change_site, default: false #現場の更新を変化した時に色が変化する
      t.boolean :color_round_batsu, default: false #○×を変化させた時に色が変化する
    end
  end
end
