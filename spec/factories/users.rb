FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "theschwad#{n}@hotmail.com"}
    password "thisisagreatpasswordprobably"
  end

end