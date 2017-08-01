class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :slug
      t.attachment :logo

      t.timestamps
    end
  end
end
