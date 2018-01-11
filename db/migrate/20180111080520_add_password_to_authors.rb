class AddPasswordToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :password, :string
  end
end
