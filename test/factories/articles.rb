FactoryBot.define do
  factory :article do
    author_admin
    title
    body

    trait :author_admin do
      association :author, factory: :admin
    end

    trait :author_teacher do
      association :author, factory: :teacher
    end

    trait :unpublished do
      state { 'unpublished' }
    end

    trait :published do
      state { 'published' }
    end
  end
end
