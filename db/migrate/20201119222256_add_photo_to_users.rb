class AddPhotoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photo, :string
  end
end
