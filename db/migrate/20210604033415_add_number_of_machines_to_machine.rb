class AddNumberOfMachinesToMachine < ActiveRecord::Migration[6.0]
  def change
    add_column :machines, :number_of_machines, :integer
  end
end
