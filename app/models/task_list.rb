class TaskList < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

	validates :task_name, presence: true
	validates :task_description, presence: true
	validates :user_id, presence: true
	validates :priority, presence: true

end
