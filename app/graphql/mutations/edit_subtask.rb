module Mutations
  class EditSubtask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Edit a subtask's information"

    argument :subtask_id, ID, required: true
    argument :new_title, String, required: false
    argument :new_description, String, required: false
    argument :new_deadline, String, required: false
    argument :new_assignee_id, ID, required: false

    field :subtask, TypesSubtask::SubtaskType, null: false

    def resolve(subtask_id: nil, new_title: nil, new_description: nil, new_assignee_id: nil, new_deadline: nil)
      creator = context[:current_user]
      subtask = Subtask.find(subtask_id)
      new_assignee = User.find_by(id: new_assignee_id)

      subtask.update_attributes(
        title: new_title || subtask.title,
        description: new_description || subtask.description,
        assignee: new_assignee || subtask.assignee,
        deadline: new_deadline || subtask.deadline
      )

      {subtask: task}
    end
  end
end
