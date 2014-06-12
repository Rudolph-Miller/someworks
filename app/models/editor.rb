class Editor < ActiveRecord::Base
	has_many :assigned_task
	has_many :task

	validates :name, presence: true
end
