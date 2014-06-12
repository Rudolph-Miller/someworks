class Task < ActiveRecord::Base
	belongs_to :publisher
	belongs_to :editor
	belongs_to :category
	has_one :assigned_task
  has_many :websites

	validates :title, presence: true
	validates :description, presence: true
	validates :reward, presence: true
	validates :reward, numericality: :only_integer
	validates :status, presence: true
	validates :status, numericality: :onlu_integer

end
