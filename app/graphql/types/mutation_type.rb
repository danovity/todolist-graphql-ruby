module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::RegisterUser
    field :signin_user, mutation: Mutations::SignInUser
    field :create_task, mutation: Mutations::CreateTask
    field :edit_task, mutation: Mutations::EditTask
    field :edit_subtask, mutation: Mutations::EditSubtask
    field :complete_task, mutation: Mutations::CompleteTask
    field :delete_task, mutation: Mutations::DeleteTask
    field :delete_subtask, mutation: Mutations::DeleteSubtask
    field :create_subtask, mutation: Mutations::CreateSubtask
    field :complete_subtask, mutation: Mutations::CompleteSubtask
  end
end
