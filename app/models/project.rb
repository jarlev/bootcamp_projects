class Project < ActiveRecord::Base


  has_many :users
  has_many :persons
  has_many :tasks
  has_many :notes

	validates :name, presence: true
	validates :due_date, presence: true
	validates :repo_name, presence: true

end
