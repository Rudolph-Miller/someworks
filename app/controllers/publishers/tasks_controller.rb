class Publishers::TasksController < ApplicationController
  def index
		@tasks=Task.all
  end

  def create
  end

  def new
  end

  def delete
  end
end
