module Mutations
  class EditTask < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself\
    description "Edit a task's information"

    argument :task_id, ID, required: true
    argument :new_title, String, required: false
    argument :new_description, String, required: false
    argument :new_deadline, String, required: false
    argument :new_assignee_id, ID, required: false

    field :task, TypesTask::TaskType, null: false

    def resolve(task_id: nil, new_title: nil, new_description: nil, new_assignee_id: nil, new_deadline: nil)
      creator = context[:current_user]
      task = Task.find(task_id)
      new_assignee = User.find_by(id: new_assignee_id)

      task.update_attributes(
        title: new_title || task.title,
        description: new_description || task.description,
        assignee: new_assignee || task.assignee,
        deadline: new_deadline || task.deadline
      )

      {task: task}
    end
  end
end
