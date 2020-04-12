module Mutations
  class DeleteTask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Delete a task"

    argument :task_id, ID, required: true

    field :task, TypesTask::TaskType, null: false

    def resolve(task_id: nil)
      task = Task.find_by(task_id)
      task&.deactivated!

      {task: task}
    end
  end
end
