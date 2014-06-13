class Publisher < ActiveRecord::Base
  has_many :websites
	has_many :tasks

	validates :name, presence: true
end
