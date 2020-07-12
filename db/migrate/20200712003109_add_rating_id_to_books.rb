class AddRatingIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :rating_id, :integer
  end
end
