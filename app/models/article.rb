class Article < ActiveRecord::Base
	default_scope {where(:deleted_at => nil)}

	belongs_to :writer
	belongs_to :assigned_task
	has_many :pictures

	def assigned_task_info ()
		self.assigned_task.task
	end
end
