class Carfare < ApplicationRecord
  belongs_to :user
  #カラムの名前をmount_uploaderに指定
  mount_uploader :image, ImageUploader
  mount_uploader :image_private_car, ImageUploader
  accepts_nested_attributes_for :user, allow_destroy: true
  # validates :user, presence:true 4/25訂正
end
