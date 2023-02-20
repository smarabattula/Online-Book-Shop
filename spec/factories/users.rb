FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password {"123456"}
    sequence(:name) { |n| "user#{n}" }
    email {"aaa@ncsu.com"}
    phone_number {"1231231231"}
    credit_card_number {"1231231231231231"}
    address {"aaaaaaaaa"}
  end
  end