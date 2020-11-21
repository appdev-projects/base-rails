class AddGropuSizeToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :group_size, :integer
  end
end
