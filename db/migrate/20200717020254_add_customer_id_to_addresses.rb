class AddCustomerIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :customer_id, :integer
  end
end
