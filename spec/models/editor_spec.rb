require 'spec_helper'

describe Editor do
	it '正常に登録できること' do
		editor = FactoryGirl.build(:editor)
		expect {editor.save!}.to_not raise_error
	end
end
