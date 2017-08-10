class RenameProfileTypeToTags < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :type, :tags
  end
end
