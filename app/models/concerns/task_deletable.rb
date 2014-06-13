module TaskDeletable
	extend ActiveSupport::Concern

	def delete_task (params)
		@params=params
		Task.where(:id => params[:id]).first.destroy
	end

	def task_params
		@params.require(:task).permit(:title, :description, :start_date, :end_date, :reward, :number)
	end
end
