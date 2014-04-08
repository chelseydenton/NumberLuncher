FactoryGirl.define do
  factory :user do
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

FactoryGirl.define do
  factory :restaurant do
    name    "Ginger Root"
    location "Union South"
  end
end