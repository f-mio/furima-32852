FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.word }
    price                 { Faker::Number.within(range: 300..9_999_999) }
    category_id           { Faker::Number.within(range: 1..10) }
    explanation           { Faker::Lorem.paragraph }
    state_id              { Faker::Number.within(range: 1..6) }
    shipping_fee_id       { Faker::Number.within(range: 1..2) }
    prefecture_id         { Faker::Number.within(range: 1..47) }
    scheduled_delivery_id { Faker::Number.within(range: 1..3) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
