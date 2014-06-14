module TaskDeletable
	extend ActiveSupport::Concern

	def delete_task (params)
		task = Task.where(:id => params[:id]).first
		task.deleted_at = Time.now
		task.save
	end

end
