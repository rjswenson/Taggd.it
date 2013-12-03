class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  mount_uploader :name, ImageUploader
  geocoded_by :location
  after_validation :geocode

  has_reputation :votes, :source => :user,
    :source_of => { :reputation => :karma,
                    :of => :user }

  def uploaded_by?(user)
    user_id == user.id
  end
  self.per_page = 15

# This is a console-use command to change S3 if image
# versions are modified within ImageUploader.

  def self.recreate_all_versions!
    self.all.each do |image|
      # image.process_your_uploader_upload = true (if using carrierwave_backgrounder)
      image.name.cache_stored_file!
      image.name.retrieve_from_cache!(image.name.cache_name)
      image.name.recreate_versions!
      image.save!
    end
  end

  def short_name
    self.name.to_s.split('/')[-1].split('.')[0].camelize
  end
end
