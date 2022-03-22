class AddItemNumberToQuotations < ActiveRecord::Migration[5.1]
  def change
    add_column :quotations, :item_number, :integer
  end
end
