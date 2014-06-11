require 'spec_helper'

describe Picture do
	it "正常に登録できること" do
		picture=FactoryGirl.build(:picture)
		expect {picture.save!}.to_not raise_error
	end
end
