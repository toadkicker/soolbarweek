class AddTypeToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :type, :string
  end
end
