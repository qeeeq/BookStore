class AddCreditCardIdToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :credit_card_id, :integer
  end
end
