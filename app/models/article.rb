class Article < ActiveRecord::Base
	default_scope {where(:deleted_at => nil)}

	belongs_to :writer
	belongs_to :assigned_task
	has_many :pictures

	validates :status, presence: true
	validates :status, numericality: :only_integer

	def assigned_task ()
		self.assigned_task.task
	end
end
