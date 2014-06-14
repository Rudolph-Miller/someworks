class Article < ActiveRecord::Base
	default_scope {where(:deleted_at => nil)}

	belongs_to :writer
	belongs_to :assigned_task
	has_many :pictures

	def assigned_task ()
		task_id = AssignedTask.where(:id => self.assigned_task_id).first.task_id
		Task.where(:id => task_id).first
	end

	def published? ()
		self.assigned_task.published?
	end

end
