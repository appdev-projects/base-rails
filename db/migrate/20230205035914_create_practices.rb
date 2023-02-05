class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :name
      t.string :body_mind
      t.string :spoken_silent
      t.string :extemp_ritual
      t.string :description

      t.timestamps
    end
  end
end
