class RemovePhotoFromUsers < ActiveRecord::Migration[6.0]
  def change
                remove_column :users, :photo
  end
end
