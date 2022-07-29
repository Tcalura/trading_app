FactoryBot.define do
  factory :user do
    name { "MyString" }
    user_name { "MyString" }
    email { "MyString" }
    birthdate { "2022-07-29" }
    vacation { false }
    country { nil }
  end
end
