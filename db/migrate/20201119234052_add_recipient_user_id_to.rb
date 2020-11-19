class AddRecipientUserIdToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :recipient_user_id, :integer
  end
end
