class AddCustomerIdToCreditCards < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :customer_id, :integer
  end
end
