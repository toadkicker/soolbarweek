class AddStatusToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :is_active, :boolean, default: true
  end
end
