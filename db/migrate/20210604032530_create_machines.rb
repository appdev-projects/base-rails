class CreateMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :machines do |t|
      t.references :arcade, null: false, foreign_key: true, index: true
      t.references :game, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
