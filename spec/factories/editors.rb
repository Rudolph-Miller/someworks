# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :editor do
    name "MyString"
    email "editor@sample.com"
    password "password"
  end
end
