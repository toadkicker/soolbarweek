class ChangeEventTypeToFilterType < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :type, :filter_type
  end
end
