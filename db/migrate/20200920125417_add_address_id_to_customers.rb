class AddAddressIdToCustomers < ActiveRecord::Migration[6.0]
  def change
  	add_column :customers, :addresses, :integer
    add_index :customers, :addresses
  end
end
