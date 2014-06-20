class Writers::AssignedTasksController < Writers::ApplicationController

  def index
		@tasks = Task.assigned_all
  end

	def show
		@task = Task.where(:id => params[:id]).first
	end
end
