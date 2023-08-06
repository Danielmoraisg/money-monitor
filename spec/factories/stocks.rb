# frozen_string_literal: true

FactoryBot.define do
  factory :stock do
    name { 'manufactured_stock' }
    ticker { 'tst12' }
    happened_at { Time.now }
    total_value { 1000.0 }
    quantity { 10.0 }
    created_at { Time.now }
    updated_at { Time.now }

    trait :from_user do
      transient do
        user { nil }
      end

      after(:create) do |stock, evaluator|
        if evaluator.user
          evaluator.user.portfolio << stock.id
          evaluator.user.save
        end
      end
    end
  end
end
