FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.user_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_kana      {'やまだ'}
    first_name_kana       {'たろう'}
    birth_day             {20200101}
  end
end