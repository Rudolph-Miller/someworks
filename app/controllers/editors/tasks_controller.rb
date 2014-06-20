class Editors::TasksController < ApplicationController
  def index
    @tasks = Task.all
    @mytasks = current_editor.tasks
    @myassigned_tasks = current_editor.assigned_tasks_list
  end

  def show
    @task = Task.where(:id=>params[:id]).first
  end

  def assign
    task = Task.where(:id=>params[:id]).first
    task.assign(params)
    redirect_to (:back)
  end

  def unassign
    task = Task.where(:id => params[:id]).first
    task.unassign
    redirect_to (:back)
  end

  def create 
    if current_editor.create_task(params)
      redirect_to editors_tasks_path
    else
      redirect_to (:back)
    end
  end

  def edit
    @task = Task.where(:id => params[:id]).first
  end

  def update
    editor = Editor.new
    if editor.update_task(params)
      redirect_to editors_tasks_show_path(:id => params[:id])
    else
      redirect_to (:back)
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
