# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    start_date "2014-06-12 09:04:10"
    end_date "2014-06-12 09:04:10"
    number 1
    reward 1
    description "MyString"
    status 1
  end
end
