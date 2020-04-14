module Mutations
  class CompleteTask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Mark the task as completed"

    argument :task_id, ID, required: true

    field :task, TypesTask::TaskType, null: false

    def resolve(task_id: nil)
      task = Task.find(task_id)
      task&.completed!

      {task: task}
    end
  end
end
