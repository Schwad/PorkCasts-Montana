FactoryGirl.define do
  factory :query do
    content "DANIEL ZOLNIKOV"
    association :user
  end
end