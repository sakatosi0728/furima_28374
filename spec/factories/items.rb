FactoryBot.define do
  factory :item do
    name                          {Faker::Name.initials(number: 2)}
    explanation                   {"新品の商品です"}
    category_id                   {Faker::Number.between(from: 1, to: 11)}
    status_id                     {Faker::Number.between(from: 1, to: 7)}
    shipping_charge_id            {Faker::Number.between(from: 1, to: 3)}
    shipping_region_id            {Faker::Number.between(from: 1, to: 48)}
    day_until_shipping_id         {Faker::Number.between(from: 1, to: 4)}
    price                         {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end


