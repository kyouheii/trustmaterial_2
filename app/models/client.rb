class Client < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :quotations, dependent: :destroy
  has_many :tusin_quotations, dependent: :destroy
  has_many :sanin_quotations, dependent: :destroy
  validates :client_name,  presence: true, length: { maximum: 50 }
end
