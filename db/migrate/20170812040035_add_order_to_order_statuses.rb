class AddOrderToOrderStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :order_statuses, :ordinality, :integer
  end
end
