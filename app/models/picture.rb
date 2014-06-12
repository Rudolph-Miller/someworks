class Picture < ActiveRecord::Base
	belongs_to :article

	has_attached_file :image
	validates :image, presence: true
	validates_attachment_content_type :image, content_type: %w{image/jpeg image/jpg image/png image/gif}
end
