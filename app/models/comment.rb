class Comment < ActiveRecord::Base
  belongs_to :image, dependent: :destroy
  belongs_to :user,  dependent: :destroy
  self.per_page = 10
end
