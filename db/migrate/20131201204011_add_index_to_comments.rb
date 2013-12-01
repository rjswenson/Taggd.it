class AddIndexToComments < ActiveRecord::Migration
  def change
    add_index :comments, :user_id
    add_index :comments, :image_id
    add_index :images, :user_id
    add_index :comments, [:user_id, :image_id]
  end
end
