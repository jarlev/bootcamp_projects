class User < ActiveRecord::Base
	validates :username, presence: true, length: { minimum: 4, maximum: 16 }  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects
  has_many :tasks
  has_many :notes

end
