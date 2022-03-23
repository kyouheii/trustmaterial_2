class Topic < ApplicationRecord

  mount_uploader :pdf, PdfUploader
  
end