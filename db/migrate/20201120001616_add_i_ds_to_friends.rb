class AddIDsToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :sender_id, :integer
    add_column :friends, :recipient_id, :integer

  end
end
