# frozen_string_literal: true

FactoryBot.define do
  factory :profession do
    title { 'First profession' }
    description { 'MyText' }
    state { 'active' }
  end
end
