module TaskDeletable
	extend ActiveSupport::Concern

	def delete_task (params)
		p params
		task = Task.where(:id => params[:id]).first
		task.deleted_at = Time.now
		task.save
	end

	def task_params
		@params.require(:task).permit(:title, :description, :start_date, :end_date, :reward, :number)
	end
end
