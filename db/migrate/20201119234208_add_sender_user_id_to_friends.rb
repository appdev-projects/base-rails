class AddSenderUserIdToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sender_user_id, :integer
  end
end
