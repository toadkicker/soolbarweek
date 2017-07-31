class Translations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.string :locale
      t.string :key
      t.text :value
      t.text :interpolations
      t.boolean :is_proc, :default => false
    end
  end
end
