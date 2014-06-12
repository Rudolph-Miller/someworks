require 'spec_helper'

describe Publisher do
	it '正常に登録できること' do
		publisher = FactoryGirl.build(:publisher)
		expect {publisher.save!}.to_not raise_error
	end
end
