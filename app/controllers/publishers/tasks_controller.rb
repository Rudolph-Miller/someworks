class Publishers::TasksController < ApplicationController

	def index
		@tasks=Task.all
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
			redirect_to :controller => 'tasks', :action => 'show', :id => params[:id]
		else
			redirect_to :controller => 'tasks', :action => 'edit', :id => params[:id]
		end
	end

	def edit
		@task = Task.where(:id => params[:id]).first
	end

	def delete
		publisher = Publisher.new
		publisher.delete_task(params)
		redirect_to :controller => 'tasks', :action => 'index'
	end

	private

	def task_params
		params.require(:task).permit(:title, :description, :start_date, :end_date, :reward, :number, :agreement)
	end

end
