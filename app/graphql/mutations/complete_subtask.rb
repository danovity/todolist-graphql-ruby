module Mutations
  class CompleteSubtask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Mark the subtask as completed"

    argument :subtask_id, ID, required: true

    field :subtask, TypesSubtask::SubtaskType, null: false

    def resolve(subtask_id: nil)
      subtask = Subtask.find_by(subtask_id)
      subtask&.completed!

      {subtask: subtask}
    end
  end
end
