class AddBookIdToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :book_id, :integer
  end
end
