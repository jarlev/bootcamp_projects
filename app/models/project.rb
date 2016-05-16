class Project < ActiveRecord::Base
	validates :name, presence: true
	validates :due_date, presence: true
	validates :repo_name, presence: true
end
