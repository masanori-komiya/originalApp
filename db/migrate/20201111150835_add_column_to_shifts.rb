class AddColumnToShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :day, :integer
    add_column :shifts, :kind, :integer
  end
end
