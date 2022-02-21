class Invoice < ApplicationRecord
  belongs_to :client, optional: true
end
