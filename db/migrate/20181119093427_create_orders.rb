class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
