class RenameCommentsCountInArcade < ActiveRecord::Migration[6.0]
  def change
    rename_column :arcades, :comment_count, :comments_count 
  end
end
