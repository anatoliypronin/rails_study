FactoryBot.define do
  factory :teacher do
    first_name
    last_name
    email
    password { '123456' }
    description
  end

  trait :del do
    state { 'deleted' }
  end

  trait :restored do
    state { 'active' }
  end
end
