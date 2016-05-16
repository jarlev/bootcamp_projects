class TaskList < ActiveRecord::Base
	validates :task_name, presence: true
	validates :task_description, presence: true
	validates :user_id, presence: true
	validates :priority, presence: true
end
