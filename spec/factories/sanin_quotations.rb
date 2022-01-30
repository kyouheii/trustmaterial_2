FactoryBot.define do
  factory :sanin_quotation do
    item_number { 1 }
    store { "MyString" }
    worked_date { "2022-01-30" }
    staff_name { "MyString" }
    work_start_time { "2022-01-30 21:16:27" }
    work_end_time { "2022-01-30 21:16:27" }
    break_time { "2022-01-30 21:16:27" }
    division { "MyString" }
    unit_price { 1 }
    commuting_allowance { 1 }
    note { "MyString" }
  end
end
