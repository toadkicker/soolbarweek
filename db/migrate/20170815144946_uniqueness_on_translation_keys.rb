class UniquenessOnTranslationKeys < ActiveRecord::Migration[5.1]
  def change
   dedupe(Translation, [:key, :locale])
    add_index :translations, [:key, :locale], unique: true
  end

  def dedupe(model, *key_attrs)
    model.select(key_attrs).group(key_attrs).having('count(*) > 1').each { |duplicates|
      dup_rows = model.where(duplicates.attributes.slice(key_attrs)).to_a
      # the first one we want to keep right?
      dup_rows.shift

      dup_rows.each{ |double| double.destroy } # duplicates can now be destroyed
    }
  end

end
