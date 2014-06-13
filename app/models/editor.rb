class Editor < ActiveRecord::Base
	include TaskCreatable
	include TaskDeletable

	has_many :assigned_tasks
	has_many :tasks

	validates :name, presence: true
end
