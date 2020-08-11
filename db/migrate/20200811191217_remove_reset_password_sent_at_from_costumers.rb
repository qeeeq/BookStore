class RemoveResetPasswordSentAtFromCostumers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :customers, :reset_password_sent_at, :datetime
  	remove_column :customers, :remember_created_at, :datetime
  end
end
