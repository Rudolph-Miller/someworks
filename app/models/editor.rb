class Editor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	include TaskCreatable
	include TaskDeletable

	has_many :assigned_tasks
	has_many :tasks, :as => :task_creatable

	validates :name, presence: true

end
