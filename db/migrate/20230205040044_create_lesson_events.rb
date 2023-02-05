class CreateLessonEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_events do |t|
      t.integer :seeker_id
      t.integer :lesson_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
