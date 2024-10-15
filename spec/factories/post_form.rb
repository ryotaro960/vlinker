FactoryBot.define do
  factory :post_form do
    
    movie_main {'https://youtu' + Faker::Lorem.sentence + '?si='}
    movie_main_embedded {Faker::Alphanumeric.alphanumeric(number: 11)}
    movie_main_thumbnail {'https://img.youtube.com/vi/' + Faker::Alphanumeric.alphanumeric(number: 11) + '/hqdefault.jpg'}
    movie_left {'https://youtu' + Faker::Lorem.sentence + '?si='}
    movie_left_embedded {Faker::Alphanumeric.alphanumeric(number: 11)}
    movie_right {'https://youtu' + Faker::Lorem.sentence + '?si='}
    movie_right_embedded {Faker::Alphanumeric.alphanumeric(number: 11)}
    talent_name {Faker::Name.first_name}
    talent_belongs {Faker::Team.name}
    talent_channel {'http' + Faker::Lorem.sentence}
    talent_x {'http' + Faker::Lorem.sentence}
    talent_hp {'http' + Faker::Lorem.sentence}
    message {Faker::String.random(length: 200)}
    talent_image { Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.jpg'), 'image/png') }

  end
end
