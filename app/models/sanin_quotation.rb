class SaninQuotation < ApplicationRecord
  belongs_to :client, optional: true
end
