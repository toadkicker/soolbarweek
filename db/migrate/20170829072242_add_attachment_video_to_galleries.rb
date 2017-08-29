class AddAttachmentVideoToGalleries < ActiveRecord::Migration[5.1]
  def self.up
    change_table :galleries do |t|
      t.attachment :video
      t.json :video_meta
    end
  end

  def self.down
    remove_attachment :galleries, :video
    remove_column :galleries, :video_meta
  end
end
