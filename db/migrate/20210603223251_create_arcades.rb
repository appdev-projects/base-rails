class CreateArcades < ActiveRecord::Migration[6.0]
  def change
    create_table :arcades do |t|
      t.string :name
      t.text :address
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
