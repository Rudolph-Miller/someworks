require 'spec_helper'

describe Website do
	it '正常に登録できること' do
		website=FactoryGirl.build(:website)
		expect {website.save!}.to_not raise_error
	end
end
