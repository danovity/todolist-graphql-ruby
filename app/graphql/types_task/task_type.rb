TypesTask::TaskType =
  GraphQL::ObjectType.define do
    name 'Task'
    description 'A task created by a user.'

    field :id, !types.ID
    field :creator_id, !types.ID
    field :assignee_id, !types.ID
    field :title, !types.String
    field :description, !types.String
    field :completed_at, types.String
    field :deadline, !types.String
    field :deactivated_at, types.String

    connection :subtasks, !TypesSubtask::SubtaskType.connection_type, "A list of the task's subtasks" do
      resolve ->(task, _arguments, _context) do
        task.subtask.active
      end
    end
  end
