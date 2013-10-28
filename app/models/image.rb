class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :name, ImageUploader
  geocoded_by :location
  after_validation :geocode
end
