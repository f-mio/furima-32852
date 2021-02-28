FactoryBot.define do
  factory :purchase_address do
    # 購入情報
    token { '11111111111111111' }

    # アドレス情報
    postal_code    { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id  { Faker::Number.within(range: 1..47) }
    city           { Gimei.address.city.kanji }
    house_num      { Gimei.address.town.kanji + Faker::Number.within(range: 1..100).to_s + '番地' }
    building       { Gimei.last.kanji + 'ビル1F' }
    tel_num        { Faker::Number.leading_zero_number(digits: 11) }
  end
end
