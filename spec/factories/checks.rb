require "faker"
require 'rails_helper'

FactoryGirl.define do
  factory :check do
    amount rand(1.00..100000.00).round(2)
    department Faker::Space.agency
    payee Fake::Name.name
    query_id 1
    payment_date Faker::Date.between(2.days.ago, Date.today)
  end
end
