class Comment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user
  self.per_page = 10
end
