class Editors::AssignedTasksController < ApplicationController
  def index
		@tasks= []
		Task.all.each do |task|
			if task.assigned?
				@tasks << task
			end
		end
  end
end
