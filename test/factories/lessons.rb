FactoryBot.define do
  factory :lesson do
    title
    description
    homework

    trait :del do
      state { 'deleted' }
    end

    trait :restore do
      state { 'active' }
    end
  end
end
