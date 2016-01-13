FactoryGirl.define do
  factory :user do
    first_name "Ryan"
    last_name "Dobrinski"
    sequence(:email) { |n| "rdob#{n}@gmail.com" }
    password "password"
  end
end
