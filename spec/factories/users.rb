FactoryBot.define do
  factory :user, class: User do
    sequence(:username) { |n| "user#{n}" }
    password {"1"}
    sequence(:name) { |n| "user#{n}" }
    email {"aaa@ncsu.com"}
    address {"123"}
    credit_card_number {"1231231231"}
    phone_number {"1231231231"}
  end
  end