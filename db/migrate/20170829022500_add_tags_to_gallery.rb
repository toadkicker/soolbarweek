class AddTagsToGallery < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :tags, :string
  end
end
