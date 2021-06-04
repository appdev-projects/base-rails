class RenameReleaseYearinGame < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :release_year, :release_date
  end
end
