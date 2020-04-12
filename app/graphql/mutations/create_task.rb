module Mutations
  class CreateTask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Create a new task"

    argument :title, String, required: true
    argument :description, String, required: true
    argument :deadline, String, required: true
    argument :assignee_id, ID, required: false

    field :task, TypesTask::TaskType, null: false

    def resolve(title: nil, description: nil, assignee_id: nil, deadline: nil)
      creator = context[:current_user]
      assignee = User.find_by(id: assignee_id) || context[:current_user]

      task = Task.create!(
        title: title,
        description: description,
        creator: creator,
        assignee: assignee,
        deadline: deadline
      )

      {task: task}
    end
  end
end
