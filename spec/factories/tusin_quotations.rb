FactoryBot.define do
  factory :tusin_quotation do
    item_number { 1 }
    store { "MyString" }
    worked_date { "2022-01-29" }
    staff_name { "MyString" }
    work_start_time { "2022-01-29 22:31:48" }
    work_end_time { "2022-01-29 22:31:48" }
    break_time { "2022-01-29 22:31:48" }
    division { "MyString" }
    unit_price { 1 }
    gain_cards { 1 }
    gain_apps { 1 }
    incentive { 1 }
    commuting_allowance { 1 }
    note { "MyString" }
  end
end
