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
    walker true
  end
end

FactoryGirl.define do
  factory :dog do
    name "Bennett"
    breed "Beagle"
    user_id 1
    body "Bennett is the best dog a kid could ask for!"
  end
end
