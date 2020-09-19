FactoryBot.define do

  factory :item do
    name              {'テレビ'}
    text              {'2019年製の黒いToshibaのテレビ'}
    genre_id          {"2"}
    delivery_fee_id   {'2'}
    user_id           {'2'}
    status_id         {'3'}
    shipping_area_id  {'3'}
    shipping_day_id   {'2'}
    price             {'500'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
