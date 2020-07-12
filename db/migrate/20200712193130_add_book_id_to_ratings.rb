class AddBookIdToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :book_id, :integer
  end
end
