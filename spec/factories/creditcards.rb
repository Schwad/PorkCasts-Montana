FactoryGirl.define do
  factory :credit_card do
    amount rand(1.00..100000.00).round(2)
    fiscal_year rand(1999..2016)
    department Faker::Space.agency
    merchant Fake::Name.name
    billing_date Faker::Date.between(2.days.ago, Date.today)
  end
end
