class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.date :completed_date

      t.timestamps
    end
  end
end