class Writer < ActiveRecord::Base
	has_many :articles
	has_many :assigned_tasks

	validates :name, presence: true
end
