TypesSubtask::SubtaskType =
  GraphQL::ObjectType.define do
    name 'Subtask'
    description "A task's subtask created by a user."

    field :id, !types.ID
    field :task_id, !types.ID
    field :creator_id, !types.ID
    field :assignee_id, !types.ID
    field :title, !types.String
    field :description, !types.String
    field :completed_at, types.String
    field :deadline, !types.String
    field :deactivated_at, types.String
  end
