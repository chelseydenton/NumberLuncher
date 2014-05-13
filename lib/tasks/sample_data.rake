namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    #make_microposts
    make_restaurants
    make_relationships

  end
end

def make_users
  admin = User.create!(
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end


def make_restaurants
  10.times do
    name = Faker::Company.name
    loc = Faker::Address.street_address

    Restaurant.create!(
        name: name,
        location: loc
      )
  end

def make_relationships

  Random.srand

  User.all.each do |user|
    Restaurant.all.each do |resto|
      if (Random.rand > 0.50)
        user.follow!(resto)
      end
    end
  end
end

end