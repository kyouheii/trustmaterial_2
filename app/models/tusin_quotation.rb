class TusinQuotation < ApplicationRecord
  belongs_to :client, optional: true
end
