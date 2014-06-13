class Publisher < ActiveRecord::Base
	include TaskCreatable
	include TaskDeletable

  has_many :websites
	has_many :tasks

	validates :name, presence: true
end
