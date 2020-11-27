FactoryBot.define do
  factory :user do
    nickname                  {"test"}
    email                     {"test@test"}
    password                  {"abc123"}
    password_confirmation     {password}
    last_name                 {"安西"}
    first_name                {"先生"}
    katakana_last_name        {"アンザイ"}
    katakana_first_name       {"センセイ"}
    birthday                  {"2020-01-01"}
  end
end
