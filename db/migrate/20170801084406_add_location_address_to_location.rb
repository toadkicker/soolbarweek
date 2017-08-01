class AddLocationAddressToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :latitude, :decimal, {:precision => 10, :scale => 6}
    add_column :locations, :longitude, :decimal, {:precision => 10, :scale => 6}
    add_column :locations, :street_address1, :string
    add_column :locations, :street_address2, :string
    add_column :locations, :city, :string, default: "Seoul"
    add_column :locations, :country, :string, default: "South Korea"
    add_column :locations, :neighborhood, :string
    add_column :locations, :telephone, :string
    add_column :locations, :website, :string
  end
end
