class Invoice < ApplicationRecord
  belongs_to :client, optional: true
  validates :sales_staff, {presence: true, length: { maximum: 50 }}
  validates :invoice_number, {presence: true}
end
