FactoryGirl.define do
  factory :credit_card do
    amount 1234.0
    fiscal_year 2013
    department "something"
    merchant "someone"
    billing_date Faker::Date.between(2.days.ago, Date.today)
  end
end