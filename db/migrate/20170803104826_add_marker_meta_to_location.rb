class AddMarkerMetaToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :marker_x, :numeric, default: 0
    add_column :locations, :marker_y, :numeric, default: 0
    add_column :locations, :marker_number, :integer, default: 0
    add_column :locations, :marker_color, :string, default: "#8f1e23"
    add_column :locations, :marker_height, :numeric, default: 13.72
    add_column :locations, :marker_width, :numeric, default: 13.72
  end
end
