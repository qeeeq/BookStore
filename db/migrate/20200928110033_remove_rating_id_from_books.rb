class RemoveRatingIdFromBooks < ActiveRecord::Migration[6.0]
  def change
  	remove_column :books, :rating_id, :integer
  end
end
