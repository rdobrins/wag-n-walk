FactoryGirl.define do
  factory :user do
    first_name "Ryan"
    last_name "Dobrinski"
    sequence(:email) { |n| "rdob#{n}@gmail.com" }
    phone_number "5555555555"
    address "33 Washington St"
    city "Boston"
    state "MA"
    zip "01234"
    password "password"
  end
end
