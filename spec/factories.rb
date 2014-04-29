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

FactoryGirl.define do
	factory :observation do
		line_size 5
		restaurant
		user
	end
end