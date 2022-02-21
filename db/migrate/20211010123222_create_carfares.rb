class CreateCarfares < ActiveRecord::Migration[5.1]
  def change
    create_table :carfares do |t|
      t.integer :user_id
      t.integer :carfare_id
      t.date :worked_day #日付
      t.string :commuting_place #勤務場所
      t.string :commuting_place_private_car #勤務場所（自家用車で移動）
      t.string :public_institution #公共機関（平野変更）
      t.string :public_transportation_departure #公共場所
      t.string :public_transportation_departure_private_car #公共場所
      t.string :point_of_departure #出発地
      t.string :point_of_departure_private_car #出発地（自家用車）
      t.string :public_transportation_arrival #到着地
      t.string :arrival_private_car #到着地（自家用車で移動）
      t.integer :public_transportation_cash #公共手段金額
      t.integer :hotel_charge #宿泊費
      t.integer :hotel_charge_private_car #宿泊費（自家用車で移動）
      t.integer :moving_distance #移動距離
      t.integer :moving_distance_private_car #移動距離（自家用車で移動）
      t.integer :highway_rate #高速料金（平野変更）
      t.integer :highway_rate_private_car #高速料金（自家用車で移動）
      t.string :parking_name #駐車場名
      t.string :parking_name_private_car #駐車場名（自家用車で移動）
      t.integer :parking_fee #駐車料金
      t.string :parking_name_private_car #駐車場名（自家用車で移動）
      t.integer :parking_fee_private_car #駐車料金（自家用車で移動）
      t.boolean :check_flag #確認済みフラグ
      t.boolean :check_flag_private_car #確認済みフラグ（自家用車で移動）
      t.string :image #交通費写真
      t.string :image_private_car #交通費写真（自家用車で移動）
      t.integer :all_pe_tr_ex #個人の交通費合計
      t.integer :sanin_public_transportation_departure #山陰公共手段
      t.integer :sanin_public_transportation_arrival_fee #山陰公共手段金額
      t.date :date_of_use #公共機関利用日 （平野追加）
      t.date :date_of_use_private_car #公共機関利用日（自家用車で移動）
      t.string :application #申請（公共機関）
      t.string :application_1 #申請（自家用車）
      t.string :application_ok #承認or否認（公共機関）
      t.string :application_ok_1 #承認or否認（機関）
      t.string :note #否認時コメント（公共機関）
      t.string :note_1 #否認時コメント（自家用車）
      t.timestamps
    end
  end
end
