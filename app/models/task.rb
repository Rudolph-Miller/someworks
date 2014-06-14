class Task < ActiveRecord::Base
	extend Enumerize
	default_scope {where(:deleted_at => nil)}

	enum status: {unpublished:0, published:1, closed:2}

	belongs_to :task_creatable, :polymorphic => true
	belongs_to :category
	has_one :assigned_task
  has_many :websites

	validates :title, presence: true
	validates :description, presence: true
	validates :reward, presence: true
	validates :reward, numericality: :only_integer
	validates :status, presence: true

	def unpublished? ()
		not self.published?
	end

	def publish ()
		unless self.status == :published
			self.status = :published
			self.save
		end
	end

	def unpublish ()
		unless self.status == :unpublished
			self.status = :unpublished
			self.save
		end
	end

	def close ()
		unless self.status == :closed
			self.status = :closed
			self.save
		end
	end

	def unclose ()
		if self.status == :closed
			self.status = :unpublished
			self.save
		end
	end
	def assign (params)
		unless Task.where(:id => self.id).first.assigned?
			task = AssignedTask.new()
			task.task_id = self.id
			task.editor_id = params[:editor_id]
			task.save
		end
	end

	def unassign ()
		self.assigned_task.destroy
	end
			
	def assigned? ()
		self.assigned_task.present?
	end

	def who_assigned ()
		self.assigned_task.editor
	end

end
