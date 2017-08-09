class AddOrdinalityToSponsors < ActiveRecord::Migration[5.1]
  def change
    add_column :sponsors, :ordinality, :integer, default: 0
  end
end
