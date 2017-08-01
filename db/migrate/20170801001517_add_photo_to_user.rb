class AddPhotoToUser < ActiveRecord::Migration[5.1]
  def change
    add_attachment :users, :photo
  end
end
