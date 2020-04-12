class Subtask < ApplicationRecord
  date_flag :deactivated_at
  date_flag :completed_at

  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :task

  scope :active, -> { where(deactivated_at: nil) }
end
