class Quotation < ApplicationRecord
  belongs_to :client, optional: true
  validates :staff_name, {presence: true, length: { maximum: 50 }}
  validates :store, {presence: true}
end
