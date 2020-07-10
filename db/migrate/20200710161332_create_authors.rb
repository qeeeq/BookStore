class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :firstname
      t.string :lastname
      t.text :biography

      t.timestamps
    end
  end
end
