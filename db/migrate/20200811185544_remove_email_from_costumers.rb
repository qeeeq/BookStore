class RemoveEmailFromCostumers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :customers, :email, :string
  	remove_column :customers, :encrypted_password, :string
  	remove_column :customers, :reset_password_token, :string

  end
end
