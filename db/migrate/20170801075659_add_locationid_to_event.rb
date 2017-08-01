class AddLocationidToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :location
  end
end
