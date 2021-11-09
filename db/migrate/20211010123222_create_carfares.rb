class CreateCarfares < ActiveRecord::Migration[5.1]
  def change
    create_table :carfares do |t|
      t.integer :carfare_id
      t.date :worked_day #日付
      t.string :commuting_place #勤務場所
      t.string :transportation #移動手段
      t.string :public_transportation_departure #公共場所
      t.string :public_transportation_arrival #公共手段到着地
      t.integer :public_transportation_cash #公共手段金額
      t.integer :hotel_charge #宿泊費
      t.integer :moving_distance #移動距離
      t.integer :highway_rate #高速料金（文字変更）
      t.integer :parking_fee #駐車料金
      t.boolean :check_flag #確認済みフラグ
      t.string :image #交通費写真
      t.integer :all_pe_tr_ex #個人の交通費合計
      t.boolean :public_transportation_departure #山陰公共手段
      t.integer :public_transportation_arrival #山陰公共手段金額
      t.integer :date_of_use #公共機関利用日 （追加）
      t.timestamps
    end
  end
end
