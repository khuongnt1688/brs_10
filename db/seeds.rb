User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              "password",
               password_confirmation: "password")
end

15.times do |n|
  content = Faker::Name.title+" #{n+1}"
  image = "default_category.png"
  Category.create!(content: content, image: image)
end