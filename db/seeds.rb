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

# Generate microposts for a subset of users.
users = User.order(:created_at)
  3.times do
  content = Faker::Lorem.sentence(word_count: 10)
  users.each { |user| user.microposts.create!(content: content) }
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..5]
followers = users[2..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
