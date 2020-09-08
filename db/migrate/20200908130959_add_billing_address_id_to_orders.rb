class AddBillingAddressIdToOrders < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :billing_address_id, :integer
    add_index :orders, :billing_address_id
  end
end
