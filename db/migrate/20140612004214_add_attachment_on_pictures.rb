class AddAttachmentOnPictures < ActiveRecord::Migration
	def up
		add_attachment :pictures, :image
	end

	def down
		add_attachment :pictures, :image
	end
end
