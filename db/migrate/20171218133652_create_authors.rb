class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :city
      t.text :address
      t.text :date_of_birth

      t.timestamps
    end
  end
end
