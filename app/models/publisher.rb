class Publisher < ActiveRecord::Base
	include TaskCreatable
	include TaskDeletable

  has_many :websites
	has_many :tasks, :as => :task_creatable

	validates :name, presence: true
end
