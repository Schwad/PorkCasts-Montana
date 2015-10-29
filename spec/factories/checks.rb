FactoryGirl.define do
  factory :check do
    amount 1234.0
    department "something"
    payee "someone"
    query_id 1
    payment_date Faker::Date.between(2.days.ago, Date.today)
  end
end