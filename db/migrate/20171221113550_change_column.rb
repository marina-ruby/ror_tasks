class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.belongs_to :article, index: true
    end
  end
end
