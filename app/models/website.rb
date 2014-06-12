class Website < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :task
	belongs_to :category

	validates :name, presence: true
	validates :url, presence: true
end
