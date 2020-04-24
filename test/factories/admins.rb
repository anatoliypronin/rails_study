FactoryBot.define do
  factory :admin do
    name
    email
    password { '123456' }

    trait :editor do
      role { 'editor' }
    end

    trait :del do
      state { 'deleted' }
    end

    trait :restored do
      state { 'active' }
    end
  end
end
