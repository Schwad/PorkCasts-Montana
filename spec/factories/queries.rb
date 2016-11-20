require 'faker'
FactoryGirl.define do
  factory :query do
    content Faker::Name.name
  end
end
