module Mutations
  class CreateSubtask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Create a new subtask for a specific task"

    argument :task_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :deadline, String, required: true
    argument :assignee_id, ID, required: false

    field :subtask, TypesSubtask::SubtaskType, null: false

    def resolve(task_id: nil, title: nil, description: nil, assignee_id: nil, deadline: nil)
      creator = context[:current_user]
      assignee = User.find_by(id: assignee_id) || context[:current_user]

      subtask = Subtask.create!(
        task_id: task_id,
        title: title,
        description: description,
        creator: creator,
        assignee: assignee,
        deadline: deadline
      )

      {subtask: subtask}
    end
  end
end
