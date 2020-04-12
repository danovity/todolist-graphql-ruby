class CreateSubtasks < ActiveRecord::Migration[5.2]
  def change
    create_table :subtasks do |t|
      t.integer :creator_id
      t.integer :assignee_id
      t.string :title
      t.string :description
      t.datetime :completed_at
      t.datetime :deactivated_at
      t.datetime :deadline
      t.integer :task_id

      t.timestamps
    end
  end
end
