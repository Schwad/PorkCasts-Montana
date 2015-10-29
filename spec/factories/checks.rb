FactoryGirl.define do
  factory :check do
    amount 1234.0
    department "something"
    payee "someone"
    query_id 1
  end
end