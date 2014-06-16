class Picture < ActiveRecord::Base
	belongs_to :article

	Paperclip.interpolates :token1 do |attachment, style|
		"#{attachment.instance.token1}"
	end

	Paperclip.interpolates :token2 do |attachment, style|
		"#{attachment.instance.token2}"
	end

	has_attached_file :image,
	:path => ":rails_root/public/:attachment/:token1/:token2",
	:url => ":rails_root/public/:attachment/:token1/:token2"

	validates :image, presence: true
	validates_attachment_content_type :image, content_type: %w{image/jpeg image/jpg image/png image/gif}

	def get_image
		"/images/#{self.token1}/#{self.token2}"
	end
end
