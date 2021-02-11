FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 4)+"a1"}
    password_confirmation {password}

    gimei = Gimei.name
    last_name {gimei.last.kanji }
    first_name {gimei.first.kanji}
    last_name_reading {gimei.last.katakana}
    first_name_reading {gimei.first.katakana}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end