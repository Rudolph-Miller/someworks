class Publishers::TasksController < ApplicationController
	def index
		@tasks=Task.all
	end

	def create
		@task = Task.new
		task=params[:task]
		@task.attribute_names.each do |key|
			@task[key]=task[key]
		end
		@task[:status]=1
		if @task.save
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
		@task = Task.where(:id => params[:id]).first
		["title", "description", "reward", "start_date", "end_date"].each do |key|
			@task.update_attributes(:id=>params[:id], key => params[:task][key])
		end
		if @task.save
			redirect_to :controller => 'tasks', :action => 'show', :id => params[:id]
		else
			redirect_to :controller => 'tasks', :action => 'edit', :id => params[:id]
		end
	end

	def edit
		@task = Task.where(:id => params[:id]).first
	end

	def delete
	end
end
