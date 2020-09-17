FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.user_name}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_day             {20200101}
  end
end