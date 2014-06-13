module TaskCreatable
	extend ActiveSupport::Concern

	def create_task (params)
		@params=params
		task=Task.new(task_params)
		task.status=1
		task.save
	end

	def task_params
		@params.require(:task).permit(:title, :description, :start_date, :end_date, :reward, :number)
	end
end

