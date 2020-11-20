class RemoveUserIdFromFriends < ActiveRecord::Migration[6.0]
  def change
    remove_column :friends, :user_id
  end
end
