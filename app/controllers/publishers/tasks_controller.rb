class Publishers::TasksController < Publishers::ApplicationController

	def index
		@tasks=Task.all
    @mytasks = current_publisher.tasks
	end

	def create
		publisher = Publisher.new
		if publisher.create_task(params)
			redirect_to '/publishers/tasks'
		else
			redirect_to '/publishers/tasks/new'
		end
	end

	def show
		@task = Task.where(:id => params[:id]).first
	end

	def new
		@task = Task.new
	end

	def update
		publisher = Publisher.new
		if publisher.update_task(params)
			redirect_to publishers_tasks_show_path(:id => params[:id])
		else
			redirect_to (:back)
		end
	end

	def edit
		@task = Task.where(:id => params[:id]).first
	end

	def delete
		publisher = Publisher.new
		publisher.delete_task(params)
		redirect_to publishers_tasks_path
	end

	def publish
		task = Task.where(:id => params[:id]).first
		if task.publish
			redirect_to (:back)
		end
	end

	def unpublish
		task = Task.where(:id => params[:id]).first
		if task.unpublish
			redirect_to (:back)
		end
	end
	private

	def task_params
		params.require(:task).permit(:title, :description, :start_date, :end_date, :reward, :number, :agreement)
	end

end
