FactoryGirl.define do
  factory :query do
    content "DANIEL ZOLNIKOV"
    association :user
    user_id 1
  end
end