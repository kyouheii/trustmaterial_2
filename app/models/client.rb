class Client < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :quotations, dependent: :destroy
end
