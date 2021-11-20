class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :sales_staff
      t.string :item
      t.string :pay_terms
      t.date :due_date
      t.integer :card_labor_cost
      t.integer :card_incentive
      t.integer :card_labor_commuting_allowance
      t.integer :cell_phone_sales_labor_cost
      t.integer :cell_phone_sales_commuting_allowance
      t.integer :cell_phone_sales_saninline
      t.integer :subtotal_fee
      t.integer :tax
      t.integer :total_fee

      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
