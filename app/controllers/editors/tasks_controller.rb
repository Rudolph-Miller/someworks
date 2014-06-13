class Editors::TasksController < ApplicationController
  def index
		@unasssigned_tasks = Task.where(:status=>1)
		#@your_assigned_tasks = current_user.AssignedTasks.where
		@assigned_tasks = Task.where(:status=>2)
  end

	def show
		@task = Task.where(:id=>params[:id]).first
	end

	def assign
		@task = Task.where(:id=>params[:id]).first
		@task.update_attributes(:id=>params[:id], :status=>2)
		@task.save
		redirect_to '/editors/tasks'
	end

	def create 
		@editor=Editor.new
		if @editor.create_task(params)
			redirect_to '/editors/tasks'
		else
			redirect_to :controller => 'tasks', :action => 'new'
		end
	end

	def new
		@task = Task.new
	end

	def delete
	end
end
