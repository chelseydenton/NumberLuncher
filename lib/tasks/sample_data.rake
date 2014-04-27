namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
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