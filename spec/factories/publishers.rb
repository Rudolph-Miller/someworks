# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher do
    name "MyString"
    email "publisher@sample.com"
    password "password"
  end
end
