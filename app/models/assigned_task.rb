class AssignedTask < ActiveRecord::Base
  belongs_to :tasks
	belongs_to :editor
end
