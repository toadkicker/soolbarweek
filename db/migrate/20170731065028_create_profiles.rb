class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :slug, unique: true
      t.string :description
      t.attachment :photo

      t.timestamps
    end
  end
end
