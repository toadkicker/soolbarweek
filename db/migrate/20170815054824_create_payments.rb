class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :payer
      t.string :full_name
      t.string :description
      t.monetize :amount
      t.json :attributes

      t.timestamps
    end
  end
end
