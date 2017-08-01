class AddLinkToSponsors < ActiveRecord::Migration[5.1]
  def change
    add_column :sponsors, :website, :string
  end
end
