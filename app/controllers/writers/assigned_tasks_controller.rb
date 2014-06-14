class Writers::AssignedTasksController < ApplicationController
  def index
		@tasks = []
		Task.all.each do |task|
			if task.assigned?
				@tasks << task
			end
		end
  end

	def show
		@task = Task.where(:id => params[:id]).first
	end
end
