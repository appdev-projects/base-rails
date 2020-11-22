class RemoveConcentrationFromCourses < ActiveRecord::Migration[6.0]
  def change
            remove_column :courses, :concentration

  end
end
