TypesSubtask::Queries::SubtaskQueryType =
  GraphQL::ObjectType.define do
    connection :subtasks, !TypesSubtask::SubtaskType.connection_type, "A list of the task's subtasks" do
      description "Find a task's subtasks"

      argument :task_id, !types.ID, "Task ID to look up"

      resolve ->(_object, arguments, context) {
        task = Task.find(arguments[:task_id])
        task.subtasks.active
      }
    end
  end
