# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
		image File.open('spec/resources/sample.png')
  end
end
