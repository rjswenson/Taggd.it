class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :name, ImageUploader
  geocoded_by :location
  after_validation :geocode

  def uploaded_by?(user)
    user_id == user.id
  end
end
