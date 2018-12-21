10.times do
  User.create!(email: Faker::Internet.free_email,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: "1234567",
              password_confirmation: "1234567")
end

user = AdminUser.create!(email: 'admin@sample.com',
             first_name: "Admin",
             last_name: "Adminenko",
             password: "1234567",
             password_confirmation: "1234567")

puts "10 users + 1 admin created"

100.times do |post|
  offset = rand(User.count)
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: User.offset(offset).first)
end

puts "100 posts has been reated"
