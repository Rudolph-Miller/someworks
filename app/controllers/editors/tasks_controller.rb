class Editors::TasksController < ApplicationController
  def index
		@assigned_tasks = []
		@unasssigned_tasks = []
		Task.all.each do |task|
			if task.assigned?
				@assigned_tasks << task
			else
				@unasssigned_tasks << task
			end
		end
  end

	def show
		@task = Task.where(:id=>params[:id]).first
	end

	def assign
		task = Task.where(:id=>params[:id]).first
		task.assign
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

	def edit
		@task = Task.where(:id => params[:id]).first
	end

	def update
		editor = Editor.new
		if editor.update_task(params)
			redirect_to :controller => 'tasks', :action => 'show', :id => params[:id]
		else
			redirect_to :controller => 'tasks', :action => 'edit', :id => params[:id]
		end
	end

	def new
		@task = Task.new
	end

	def delete
		editor = Editor.new
		editor.delete_task(params)
		redirect_to :controller => 'tasks', :action => 'index'
	end
end
