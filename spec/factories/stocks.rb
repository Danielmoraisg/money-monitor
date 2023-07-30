# frozen_string_literal: true

FactoryBot.define do
  factory :stock do
    name { 'manufactored_stock' }
    ticker { 'tst12' }
    happened_at { Time.now }
    total_value { 1000.0 }
    quantity { 10.0 }
    created_at { Time.now }
    updated_at { Time.now }

    trait :with_specific_id do
      id { 42 }
    end
  end
end
