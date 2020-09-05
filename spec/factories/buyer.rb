FactoryBot.define do
  factory :buyer do
    postal_code                   {"123-4567"}
    shipping_region_id            {Faker::Number.between(from: 1, to: 48)}
    city                          {"奈良市奈良町"}
    address                       {"奈良1-1-1"}
    phone_number                  {"09012345678"}
  end
end
