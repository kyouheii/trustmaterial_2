class AddSnslinkToTitles < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :line, :string
  end
end
