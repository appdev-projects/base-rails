class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :fan, null: false, foreign_key: { to_table: :users }, index: true
      t.references :game, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
