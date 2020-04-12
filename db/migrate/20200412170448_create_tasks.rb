class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :creator_id
      t.integer :assignee_id
      t.string :title
      t.string :description
      t.datetime :completed_at

      t.timestamps
    end
  end
end
