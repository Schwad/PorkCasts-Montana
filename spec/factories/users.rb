require 'faker'
FactoryGirl.define do

  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password Faker::Internet.password
  end

end
