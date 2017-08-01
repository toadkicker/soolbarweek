class AddProfileIdToEvent < ActiveRecord::Migration[5.1]
  change_table :events do |t|
    t.references :profile
  end
end
