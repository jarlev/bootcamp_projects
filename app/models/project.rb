class Project < ActiveRecord::Base

  has_many :people
  has_many :users, through: :people
  has_many :task_lists
  has_many :notes

	validates :name, presence: true
	validates :due_date, presence: true
	validates :repo_name, presence: true

end
