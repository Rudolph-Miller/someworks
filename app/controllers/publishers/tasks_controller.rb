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
	end

	def new
		@task = Task.new
	end

	def delete
	end
end
