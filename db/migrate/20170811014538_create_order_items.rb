class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true, required: false
      t.references :order, foreign_key: true
      t.monetize :unit_price, default: 0
      t.integer :quantity
      t.monetize :total_price

      t.timestamps
    end
  end
end
