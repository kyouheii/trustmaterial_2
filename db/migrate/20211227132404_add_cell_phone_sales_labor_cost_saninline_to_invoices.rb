class AddCellPhoneSalesLaborCostSaninlineToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :cell_phone_sales_labor_cost_saninline, :integer
  end
end
