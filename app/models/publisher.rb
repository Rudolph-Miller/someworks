class Publisher < ActiveRecord::Base
  has_many :websites
	has_many :task

	validates :name, presence: true
end
