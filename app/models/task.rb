class Task < ActiveRecord::Base
	extend Enumerize

	enum status: {unpublished:0, published:1, closed:2}

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

	def unpublished? ()
		not self.published?
	end

	def publish ()
		unless self.status == :published
			self.status = :published
		end
	end

	def unpublish ()
		unless self.status == :unpublished
			self.status = :unpublished
		end
	end

	def close ()
		unless self.status == :closed
			self.status = :closed
		end
	end

	def unclose ()
		if self.status == :closed
			self.status = :unpublished
		end
	end
end
