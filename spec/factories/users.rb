FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.initials(number: 2) }
    email                     { Faker::Internet.free_email }
    password                  { 'abc123' }
    password_confirmation     { password }
    last_name                 { '安西' }
    first_name                { '先生' }
    katakana_last_name        { 'アンザイ' }
    katakana_first_name       { 'センセイ' }
    birthday                  { Faker::Date.in_date_period }
  end
end
