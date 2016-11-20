require "faker"
require 'rails_helper'
FactoryGirl.define do
  factory :check do
    amount (1..1000).to_a.sample.to_f
    department Faker::Space.agency
    payee Faker::Name.name
    query_id 1
    payment_date Faker::Date.between(2.days.ago, Date.today)
  end
end
