class Task < ApplicationRecord
  date_flag :deactivated_at
  date_flag :completed_at

  has_many :subtask

  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'

  scope :active, -> { where(deactivated_at: nil) }
end
