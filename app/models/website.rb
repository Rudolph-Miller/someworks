class Website < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :task
end
