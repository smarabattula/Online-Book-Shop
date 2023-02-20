FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password {"1"}
    sequence(:name) { |n| "user#{n}" }
    email {"aaa@ncsu.com"}
    phone_number {"1231231231"}
  end
  end