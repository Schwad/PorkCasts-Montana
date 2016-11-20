require 'faker'
FactoryGirl.define do
  factory :credit_card do
    amount (1..1000).to_a.sample.to_f
    fiscal_year (1999..2016).to_a.sample
    department Faker::Space.agency
    merchant Faker::Name.name
    billing_date Faker::Date.between(2.days.ago, Date.today)
  end
end
