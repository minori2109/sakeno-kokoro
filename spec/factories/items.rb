FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials }
    price             { Faker::Number.within(range: 100..9_999_999) }
    info              { Faker::Lorem.paragraph }
    size              { Faker::Number.within(range: 720..2000) }
    alcohol_degree    { Faker::Number.within(range: 10..30) }
    association :category
    association :rice
    association :storage_method
    association :kuramoto
    prefecture_id     { Faker::Number.within(range: 1..47) }
    delivery_method   { Faker::Lorem.word }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
