class AddOrderIdToShippingAddresses < ActiveRecord::Migration[6.0]
  def change
  	add_column :shipping_addresses, :order_id, :integer
    add_index :shipping_addresses, :order_id
    # add_column :customers, :address_id, :integer
  end
end
