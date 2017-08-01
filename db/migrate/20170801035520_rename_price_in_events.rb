class RenamePriceInEvents < ActiveRecord::Migration[5.1]
  change_table :events do |t|
    t.monetize :price
  end
end
