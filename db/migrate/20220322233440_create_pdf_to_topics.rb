class CreatePdfToTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :pdf_to_topics do |t|
      t.string :pdf
    end
  end
end
