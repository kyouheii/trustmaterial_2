require 'rails_helper'

RSpec.describe Invoice, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '正常系の機能' do
    context '登録する' do
      it '正しく登録できること' do
        invoice Invoice.new(
          sales_staff: '営業担当者3',
          item: '品名3',
          pay_terms: '支払条件3',
          due_date: '期日3',
          card_labor_cost: 'コスモカード人件費3',
          card_incentive: 'コスモカード獲得インセンティブ3',
          card_labor_commuting_allowance: 'コスモカードスタッフ交通費3',
          cell_phone_sales_labor_cost: '通信事業人件費3',
          cell_phone_sales_commuting_allowance: '通信事業交通費（備品代込み）3',
          cell_phone_sales_labor_cost_saninline: '通信事業(山陰)人件費合計3',
          cell_phone_sales_saninline: '通信事業(山陰)人件費合計3',
          subtotal_fee: '小計3',
          tax: '消費税3',
          total_fee: 'すべての項目合計3')

        expect(invoice).to be_valid

        invoice.save

        entered_invoice = Invoice.find(1);

        expect(entered_invoice.sales_staff).to eq('営業担当者3')
        expect(entered_invoice.item).to eq('品名3')
        expect(entered_invoice.pay_terms).to eq('支払条件3')
        expect(entered_invoice.due_date).to eq('期日3')
        expect(entered_invoice.card_labor_cost).to eq('コスモカード人件費3')
        expect(entered_invoice.card_incentive).to eq('コスモカード獲得インセンティブ3')
        expect(entered_invoice.card_labor_commuting_allowance).to eq('コスモカードスタッフ交通費3')
        expect(entered_invoice.cell_phone_sales_labor_cost).to eq('通信事業人件費3')
        expect(entered_invoice.cell_phone_sales_commuting_allowance).to eq('通信事業交通費（備品代込み）3')
        expect(entered_invoice.cell_phone_sales_labor_cost_saninline).to eq('通信事業(山陰)人件費合計3')
        expect(entered_invoice.cell_phone_sales_saninline).to eq('通信事業(山陰)人件費合計3')
        expect(entered_invoice.subtotal_fee).to eq('小計3')
        expect(entered_invoice.tax).to eq('消費税3')
        expect(entered_invoice.total_fee).to eq('すべての項目合計3')
      end
    end
  end  
end
