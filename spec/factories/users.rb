# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'ju' }
    email { 'ju@mail.com' }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
