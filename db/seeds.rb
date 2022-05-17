User.create!(name: "Luan Dang",
             email: "luandang@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
# Generate a bunch of additional users.
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123123"
  User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now)
end
