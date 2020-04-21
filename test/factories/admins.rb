FactoryBot.define do
  factory :admin do
    name
    email
    password {'123456'}
  end
end
