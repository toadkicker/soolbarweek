class AddIsActiveToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_active, :boolean, default: true
  end
end
