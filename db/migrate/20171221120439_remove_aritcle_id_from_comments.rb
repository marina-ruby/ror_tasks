class RemoveAritcleIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :aritcle_id, :integer
  end
end
