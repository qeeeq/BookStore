class AddBookIdToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :book_id, :integer
  end
end
