class Category < ActiveRecord::Base
	has_many :website
	has_many :task
	validates :name, presence: true
end
