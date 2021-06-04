class RenameFavoritesCountInUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :favorite_count, :favorites_count 
  end
end
