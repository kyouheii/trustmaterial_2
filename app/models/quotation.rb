class Quotation < ApplicationRecord
  belongs_to :client, optional: true
end
