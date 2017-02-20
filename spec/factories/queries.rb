require 'faker'
#require 'rails_helper'
FactoryGirl.define do
  factory :query do
    content Faker::Name.name
  end
end
