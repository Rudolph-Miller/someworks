class Task < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :editor
	has_one :assigned_task
  has_many :websites
end
