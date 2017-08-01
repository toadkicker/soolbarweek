class AddAttachmentLogoToSponsors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sponsors do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :sponsors, :logo
  end
end
