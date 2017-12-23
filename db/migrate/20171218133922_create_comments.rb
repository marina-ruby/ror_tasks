class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :aritcle, index: true
      t.string :user_name
      t.text :text

      t.timestamps
    end
  end
end
