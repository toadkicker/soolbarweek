class CreateGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description
      t.attachment :media
      t.boolean :active

      t.timestamps
    end
  end
end
