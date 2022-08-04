# frozen_string_literal: true

FactoryBot.define do
  factory :user do
  end

  factory :requester, parent: :user do
    name { 'MyString' }
    user_name { 'MyString' }
    email { 'MyString' }
    birthdate { '2022-07-29' }
    vacation { false }
    country { create(:country) }

    after :create do |user|
      create :inventory, :inventory_laser, user: user
    end
  end

  factory :provider, parent: :user do
    name { 'MyString' }
    user_name { 'MyString' }
    email { 'MyString' }
    birthdate { '2022-07-29' }
    vacation { false }
    country { create(:country) }

    after :create do |user|
      create :inventory, :inventory_desktop, user: user
    end
  end
end
