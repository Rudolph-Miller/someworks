require 'spec_helper'

describe Article do
	it '正常に登録できること' do
		article=FactoryGirl.build(:article)
		expect {article.save!}.to_not raise_error
	end
end
