class AddCustomerIdToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :customer_id, :integer
  end
end
