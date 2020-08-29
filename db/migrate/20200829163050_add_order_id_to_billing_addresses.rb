class AddOrderIdToBillingAddresses < ActiveRecord::Migration[6.0]
  def change
  	add_column :billing_addresses, :order_id, :integer
    add_index :billing_addresses, :order_id
  end
end