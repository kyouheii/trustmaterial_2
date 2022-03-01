class AddInvoiceNumberToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :invoice_number, :string
  end
end
