class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :section
      t.string :group_work
      t.string :group_size_min
      t.string :group_size_max
      t.string :concentration

      t.timestamps
    end
  end
end
