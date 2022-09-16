# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    name { Faker::Name.name }
    price { Faker::Commerce.price }
  end
end
