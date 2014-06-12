class Website < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :task

	validates :name, presence: true
	validates :url, presence: true
end
