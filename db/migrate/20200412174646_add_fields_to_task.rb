class AddFieldsToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :datetime
    add_column :tasks, :deactivated_at,  :datetime
  end
end
