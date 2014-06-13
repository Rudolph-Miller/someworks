class Article < ActiveRecord::Base
	belongs_to :writer
	belongs_to :assigned_task
	has_many :pictures

	validates :status, presence: true
	validates :status, numericality: :only_integer
end
