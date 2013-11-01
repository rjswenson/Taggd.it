class Image < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :location, presence: true
  mount_uploader :name, ImageUploader
  geocoded_by :location
  after_validation :geocode

  def uploaded_by?(user)
    user_id == user.id
  end
end
