# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :writer do
    name "MyString"
    email "writer@sample.com"
    password "password"
  end
end
