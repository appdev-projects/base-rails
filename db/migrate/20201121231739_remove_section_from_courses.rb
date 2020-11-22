class RemoveSectionFromCourses < ActiveRecord::Migration[6.0]
  def change
        remove_column :courses, :section
  end
end
