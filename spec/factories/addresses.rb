FactoryBot.define do
  factory :address do
    post_code                 { '123-4567' }
    prefecture_id             { 2 }
    municipality              { Faker::Name.initials(number: 6) }
    house_number              { Faker::Name.initials(number: 6) }
    building_name             { Faker::Name.initials(number: 6) }
    phone_number              { '09012345678' }
    association :order
  end
end
