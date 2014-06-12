class Writer < ActiveRecord::Base
	has_many :article
	has_many :assigned_task

	validates :name, presence: true
end
