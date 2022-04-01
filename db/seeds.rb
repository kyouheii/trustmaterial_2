User.create!(name: "管理者",
  email: "ytve1052@yahoo.co.jp",
  phone_number: "090-0000-0001",
  nearest_station: "岡山",
  password: "ytve1052",
  password_confirmation: "ytve1052",
  admin: true)


User.create!(name: "宅麻伸",
  email: "sample-1@email.com",
  phone_number: "090-0000-0000",
  nearest_station: "岡山",
  password: "password",
  password_confirmation: "password")

User.create!(name: "オダギリジョー",
  email: "sample-2@email.com",
  phone_number: "090-1111-1111",
  nearest_station: "倉敷",
  password: "password",
  password_confirmation: "password")

  User.create!(name: "白神恭平",
    email: "sample-3@email.com",
    password: "password",
    password_confirmation: "password",
    admin: false)

puts "users created"

Client.create!(client_number: 1,
  client_name: "柴田竜拓",
  postal_code: "700-0000",
  address: "岡山県岡山市",
  manager: "柴田竜拓広報",
  phone_number: "080-0000-0000"
  )

Client.create!(client_number: 2,
  client_name: "佐野恵太",
  postal_code: "700-1111",
  address: "岡山県倉敷市",
  manager: "佐野恵太広報",
  phone_number: "080-0000-0000")

puts "clients created"

Invoice.create!(invoice_date: "",
  invoice_number: "",
  sales_staff: "営業担当者1",
  item: "品名1",
  pay_terms: "支払条件1",
  due_date: "期日1",
  card_labor_cost: "コスモカード人件費1",
  card_incentive: "コスモカード獲得インセンティブ1",
  card_labor_commuting_allowance: "コスモカードスタッフ交通費1",
  cell_phone_sales_labor_cost: "通信事業人件費1",
  cell_phone_sales_commuting_allowance: "通信事業交通費（備品代込み）1",
  cell_phone_sales_labor_cost_saninline: "通信事業(山陰)人件費合計1",
  cell_phone_sales_saninline: "通信事業(山陰)人件費合計1",
  subtotal_fee: "小計1",
  tax: "消費税1",
  total_fee: "すべての項目合計1")

Invoice.create!(invoice_date: "",
  invoice_number: "",
  sales_staff: "営業担当者2",
  item: "品名2",
  pay_terms: "支払条件2",
  due_date: "期日2",
  card_labor_cost: "コスモカード人件費2",
  card_incentive: "コスモカード獲得インセンティブ2",
  card_labor_commuting_allowance: "コスモカードスタッフ交通費2",
  cell_phone_sales_labor_cost: "通信事業人件費2",
  cell_phone_sales_commuting_allowance: "通信事業交通費（備品代込み）2",
  cell_phone_sales_labor_cost_saninline: "通信事業(山陰)人件費合計2",
  cell_phone_sales_saninline: "通信事業(山陰)人件費合計2",
  subtotal_fee: "小計2",
  tax: "消費税2",
  total_fee: "すべての項目合計2")
  
puts "invoices created"

Quotation.create!(item_number: "",
  store: "店舗名1",
  worked_date: "2021-01-01",
  staff_name: "スタッフ1",
  work_start_time: "09:00",
  work_end_time: "18:00",
  break_time: "01:00",
  division: "区分1",
  unit_price: 0,
  gain_cards: 0,
  gain_apps: 0,
  incentive: 0,
  commuting_allowance: 0,
  note: "備考1")

Quotation.create!(item_number: "",
  store: "店舗名2",
  worked_date: "2021-01-02",
  staff_name: "スタッフ12",
  work_start_time: "10:00",
  work_end_time: "19:00",
  break_time: "01:00",
  division: "区分2",
  unit_price: 0,
  gain_cards: 0,
  gain_apps: 0,
  incentive: 0,
  commuting_allowance: 0,
  note: "備考2")
  
puts "quotations created"

TusinQuotation.create!(item_number: "",
  store: "店舗名1",
  worked_date: "2021-01-01",
  staff_name: "スタッフ1",
  work_start_time: "09:00",
  work_end_time: "18:00",
  break_time: "01:00",
  division: "区分1",
  unit_price: 0,
  commuting_allowance: 0,
  note: "備考1")

TusinQuotation.create!(item_number: "",
  store: "店舗名2",
  worked_date: "2021-01-02",
  staff_name: "スタッフ12",
  work_start_time: "10:00",
  work_end_time: "19:00",
  break_time: "01:00",
  division: "区分2",
  unit_price: 0,
  commuting_allowance: 0,
  note: "備考2")
  
puts "tusin_quotations created"

SaninQuotation.create!(item_number: "",
  store: "店舗名1",
  worked_date: "2021-01-01",
  staff_name: "スタッフ1",
  work_start_time: "09:00",
  work_end_time: "18:00",
  break_time: "01:00",
  division: "区分1",
  unit_price: 0,
  commuting_allowance: 0,
  note: "備考1")

SaninQuotation.create!(item_number: "",
  store: "店舗名2",
  worked_date: "2021-01-02",
  staff_name: "スタッフ12",
  work_start_time: "10:00",
  work_end_time: "19:00",
  break_time: "01:00",
  division: "区分2",
  unit_price: 0,
  commuting_allowance: 0,
  note: "備考2")
  
puts "tusin_quotations created"
