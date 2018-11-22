class AddDateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :start_time, :datetime
    add_column :orders, :end_time, :datetime
  end
end
