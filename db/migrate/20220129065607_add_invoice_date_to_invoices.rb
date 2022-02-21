class AddInvoiceDateToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :invoice_date, :string
  end
end
