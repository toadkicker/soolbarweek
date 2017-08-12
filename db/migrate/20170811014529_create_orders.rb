class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.monetize :subtotal, precision: 12, scale: 3
      t.monetize :tax, precision: 12, scale: 3
      t.monetize :shipping, precision: 12, scale: 3
      t.monetize :total, precision: 12, scale: 3
      t.references :order_status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
