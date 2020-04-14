module Mutations
  class DeleteSubtask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Delete a subtask that belongs to a specific task"
    argument :subtask_id, ID, required: true

    field :subtask, TypesSubtask::SubtaskType, null: false

    def resolve(subtask_id: nil)
      subtask = Task.find(subtask_id)
      subtask&.deactivated!

      {subtask: subtask}
    end
  end
end
