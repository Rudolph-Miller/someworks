require 'spec_helper'

describe Writer do
	it '正常に登録できること' do
		writer = FactoryGirl.build(:writer)
		expect {writer.save!}.to_not raise_error
	end
end
