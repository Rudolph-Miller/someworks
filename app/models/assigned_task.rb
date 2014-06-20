class AssignedTask < ActiveRecord::Base
	belongs_to :task
	belongs_to :editor
	has_many :articles
end
