# frozen_string_literal: true

FactoryBot.define do
  factory :inventory do
    trait :inventory_desktop do
      user { nil }
      device { create(:desktop_gamer) }
      quantity { 5 }
    end

    trait :inventory_notebook do
      user { nil }
      device { create(:notebook) }
      quantity { 5 }
    end

    trait :inventory_laser do
      user { nil }
      device { create(:laser_printer) }
      quantity { 5 }
    end

    trait :inventory_smartphone do
      user { nil }
      device { create(:smartphone) }
      quantity { 5 }
    end

    trait :inventory_mouse do
      user { nil }
      device { create(:mouse) }
      quantity { 5 }
    end
  end
end
