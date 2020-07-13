class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.integer :CVV
      t.integer :expiration_month
      t.integer :expiration_year
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
