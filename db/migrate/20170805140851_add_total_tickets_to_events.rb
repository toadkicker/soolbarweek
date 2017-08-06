class AddTotalTicketsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :max_seats, :integer, default: 0
  end
end
