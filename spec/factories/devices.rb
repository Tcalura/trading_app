# frozen_string_literal: true

FactoryBot.define do
  factory :device do
  end

  factory :desktop_gamer, parent: :device do
    name { 'Desktop Gamer' }
    price { 252.0 }
  end

  factory :notebook, parent: :device do
    name { 'Notebook' }
    price { 202.0 }
  end

  factory :laser_printer, parent: :device do
    name { 'Laser Printer' }
    price { 126.0 }
  end

  factory :smartphone, parent: :device do
    name { 'Smartphone' }
    price { 50.0 }
  end

  factory :mouse, parent: :device do
    name { 'Mouse' }
    price { 20.0 }
  end
end
