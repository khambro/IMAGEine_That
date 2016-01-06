class Photo < ActiveRecord::Base
  mount_uploader :image_file, ImageFileUploader
  belongs_to :user
  has_many :reviews
end
