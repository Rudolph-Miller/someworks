class Article < ActiveRecord::Base
	belongs_to :writer
	belongs_to :assigned_task
	has_many :picture

	validates :status, presence: true
	validates :status, numericality: :only_integer
end
