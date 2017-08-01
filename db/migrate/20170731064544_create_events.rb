class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.string :short_description
      t.string :description
      t.date :start_time
      t.date :end_time
      t.string :type

      t.timestamps
    end
  end
end
