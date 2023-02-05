class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :course_id
      t.integer :practice_id
      t.integer :day
      t.string :title
      t.string :description
      t.string :teaching_link
      t.string :audio_link

      t.timestamps
    end
  end
end
