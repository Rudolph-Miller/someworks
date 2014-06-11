require 'spec_helper'

describe AssignedTask do
	it '正常に登録できること' do
		assigned_task = FactoryGirl.build(:assigned_task)
		expect {assigned_task.save!}.to_not raise_error
	end
end
