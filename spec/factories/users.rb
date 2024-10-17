FactoryBot.define do

  factory :user do

    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 8)}
    password_confirmation {password}
  
    after(:build) do |user|
      user.user_image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

  end
end