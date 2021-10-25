class CreateCarfares < ActiveRecord::Migration[5.1]
  def change
    create_table :carfares do |t|
      t.date :worked_on #日付
      t.string :site_id #現場ID
      t.integer :site_id_no #現場IDナンバー
      t.string :work_place #出勤場所
      t.string :transportation #移動手段
      t.string :public_transportation #公共移動手段
      t.string :departure_place #出発地
      t.string :arrival_place #到着地
      t.integer :amount #金額
      t.integer :accommodation_fee #宿泊費
      t.integer :moving_distance #移動距離
      t.integer :high_speed_rate #高速料金
      t.integer :parking_fee #駐車料金
      t.boolean :confirmed_flag #確認済みフラグ
      t.boolean :approval_flag #承認フラグ
      t.boolean :rejection_flag #却下フラグ

      t.timestamps
    end
  end
end
