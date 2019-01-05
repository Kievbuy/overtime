FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.free_email }
    password   { '1234567' }
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin_user, class: AdminUser do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.free_email }
    password   { '1234567' }
  end
end
