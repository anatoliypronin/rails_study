FactoryBot.define do
  factory :article do
    author_admin
    title
    body
    published { false }
    state { 'active' }

    trait :author_admin do
      association :author, factory: :admin
    end

    trait :author_teacher do
      association :author, factory: :teacher
    end
  end
end
