class Client < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :quotations, dependent: :destroy
  validates :client_name,  presence: true, length: { maximum: 50 }
end
