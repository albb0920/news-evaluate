# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :marker_comment do
    selection "MyString"
    comment "MyString"
    review nil
  end
end
