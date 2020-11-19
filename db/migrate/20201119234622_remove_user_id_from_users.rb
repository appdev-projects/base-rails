class RemoveUserIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_id
  end
end
