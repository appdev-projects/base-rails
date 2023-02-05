class AddSpiritualTypeTolessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :spiritual_type, :string
  end
end
