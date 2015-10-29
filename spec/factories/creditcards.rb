FactoryGirl.define do
  factory :credit_card do
    amount 1234.0
    fiscal_year 2013
    department "something"
    merchant "someone"
    query_id 1
  end
end