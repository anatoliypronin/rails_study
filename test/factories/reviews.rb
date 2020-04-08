# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    body { 'MyText' }
    student { nil }
    course { nil }
  end
end
