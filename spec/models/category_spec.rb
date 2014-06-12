require 'spec_helper'

describe Category do
	it '正常に登録できること' do
		category = FactoryGirl.build(:category)
		expect {category.save!}.to_not raise_error
	end
end
