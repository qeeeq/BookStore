class CreateBillingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :billing_addresses do |t|
      t.integer :address_id

      t.timestamps
    end
  end
end
