class AddShippingAddressIdToOrders < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :shipping_address_id, :integer
    add_index :orders, :shipping_address_id
  end
end
