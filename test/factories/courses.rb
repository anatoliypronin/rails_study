FactoryBot.define do
  factory :course do
    title
    description
    teacher

    trait :del do
      state { 'deleted' }
    end

    trait :restored do
      state { 'active' }
    end
  end
end
