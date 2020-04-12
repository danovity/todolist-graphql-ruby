TypesTask::Queries::TaskQueryType =
  GraphQL::ObjectType.define do
    connection :userTasks, !TypesTask::TaskType.connection_type, "A list of the user's tasks" do
      resolve ->(_object, _arguments, context) {
        Task.active.where(creator_id: context[:current_user], assignee_id: context[:current_user])
      }
    end
  end
