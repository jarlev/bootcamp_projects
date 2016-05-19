class User < ActiveRecord::Base
	validates :username, presence: true, length: { minimum: 4, maximum: 16 }  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :people
  has_many :projects, through: :people
  has_many :task_lists
  has_many :notes

end
