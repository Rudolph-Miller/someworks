class Article < ActiveRecord::Base
	belongs_to :writer
	belongs_to :assigned_task
	has_many :picture
end
