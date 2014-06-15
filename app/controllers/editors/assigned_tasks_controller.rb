class Editors::AssignedTasksController < ApplicationController
  def index
		@tasks= Task.assigned_all
  end

	def unassign
		task = Task.where(:id => params[:id]).first
		task.unassign
		redirect_to editors_assigned_tasks_path
	end
end
