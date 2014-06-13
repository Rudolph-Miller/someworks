module TaskCreatable
	extend ActiveSupport::Concern

	def create_task (params)
		@params=params
		task=Task.new(task_params)
		task.status = :unpublished
		task.save
	end

	def update_task (params)
		@params=params
		task = Task.where(:id => params[:id]).first
		task.update_attributes(task_params)
		task.save
	end

	def task_params
		@params.require(:task).permit(:title, :description, :start_date, :end_date, :reward, :number)
	end
end

