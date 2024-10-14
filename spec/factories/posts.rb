FactoryBot.define do
  factory :post do
    
    movie_main {'https://youtu' + Faker::Lorem.sentence + '?si='}
    movie_main_thumbnail {'https://img.youtube.com/vi/' + Faker::Alphanumeric.alphanumeric(number: 11) + '/hqdefault.jpg'}
    movie_left {'https://youtu' + Faker::Lorem.sentence + '?si='}
    movie_right {'https://youtu' + Faker::Lorem.sentence + '?si='}
    talent_name {Faker::Name.first_name}
    talent_belongs {Faker::Team.name}
    talent_channel {'http' + Faker::Lorem.sentence}
    talent_x {'http' + Faker::Lorem.sentence}
    talent_hp {'http' + Faker::Lorem.sentence}
    message {Faker::Lorem.sentence}

    after(:build) do |post|
      post.talent_image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
    
  end
end
