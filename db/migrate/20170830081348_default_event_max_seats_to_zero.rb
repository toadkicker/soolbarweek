class DefaultEventMaxSeatsToZero < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :max_seats, :integer, default: 0
  end
end
