require 'rails_helper'

RSpec.describe Quotation, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '正常系の機能' do
    context '登録する' do
      it '正しく登録できること' do
        quotation Quotation.new(
          store: '店舗名3',
          worked_date: '2021-01-03',
          staff_name: 'スタッフ3',
          work_start_time: '09:00',
          work_end_time: '18:00',
          break_time: '01:00',
          division: '区分3',
          unit_price: 15000,
          gain_cards: 3,
          gain_apps: 3,
          incentive: 2000,
          commuting_allowance: 1000,
          note: '備考3')

        expect(quotation).to be_valid

        quotation.save

        entered_quotation = Quotation.find(1);

        expect(entered_quotation.store).to eq('店舗名3')
        expect(entered_quotation.worked_date).to eq('2021-01-03')
        expect(entered_quotation.staff_name).to eq('スタッフ3')
        expect(entered_quotation.work_start_time).to eq('09:00')
        expect(entered_quotation.work_end_time).to eq('18:00')
        expect(entered_quotation.break_time).to eq('01:00')
        expect(entered_quotation.division).to eq('区分3')
        expect(entered_quotation.unit_price).to eq(15000)
        expect(entered_quotation.gain_cards).to eq(3)
        expect(entered_quotation.gain_apps).to eq(3)
        expect(entered_quotation.incentive).to eq(2000)
        expect(entered_quotation.commuting_allowance).to eq(1000)
        expect(entered_quotation.note).to eq('備考3')
      end
    end
  end
end
