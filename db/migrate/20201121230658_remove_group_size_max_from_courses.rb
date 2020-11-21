class RemoveGroupSizeMaxFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :group_size_max
  end
end
