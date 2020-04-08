# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    body { 'MyText' }
    student { Student.last }
    course { Course.last }
  end
end
