class CreateArcades < ActiveRecord::Migration[6.0]
  def change
    create_table :arcades do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
