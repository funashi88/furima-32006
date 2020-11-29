FactoryBot.define do
  factory :item do
    name                           { Faker::Name.initials(number: 6) }
    explanation                    { Faker::Name.initials(number: 6) }
    category_id                    { 2 }
    item_condition_id              { 2 }
    delivery_fee_burden_id         { 2 }
    prefecture_id                  { 2 }
    days_to_ship_id                { 2 }
    price                          { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
