class TaskList < ActiveRecord::Base

  STATES = %w(unstarted started finished accepted)

  belongs_to :project
  belongs_to :user

  before_validation(on: :create) do 
    self.state = "unstarted"
  end 

	validates :task_name, presence: true
	validates :task_description, presence: true
	validates :user_id, presence: true
	validates :priority, presence: true
  validates :state, presence: true
  validates_inclusion_of :state, in: STATES

  def change_state
    case self.state
    when "unstarted"
      self.state = "started"
    when "started"
      self.state = "finished"
    when "finished"
      self.state = "accepted"
    end
    self.save!
  end 

  def add_unstarted_state
    self.state = "unstarted"
  end 

end
