require 'spec_helper'

describe Task do
	it '正常に登録できること' do
		task=FactoryGirl.build(:task)
		expect {task.save!}.to_not raise_error
	end
end
