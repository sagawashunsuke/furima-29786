FactoryBot.define do
  
  factory :OrderAddress do
    zip_code             {"123-4567"}
    city                 {"東京"}
    house_number         {"青山1-2-3"}
    telephone            {"09098765432"}
    token                {"dddddddaaaaa"}
    prefecture_id        {"2"}
    association :user
    association :item
    
  end
end
